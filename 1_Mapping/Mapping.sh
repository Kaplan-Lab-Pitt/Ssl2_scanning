#!/bin/bash

#SBATCH --job-name=TSS_mut
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --time=0-24:00:00                     
#SBATCH --mem=64g
#SBATCH --output=out%j.out
#SBATCH --error=err%j.err

# This is the script used to map the sequencing reads to yeast genome by library. By Tingting Zhao.
# To run on Pitt supercomputing system: sbatch .sh
# Input: fastq
# Output: stranded bedgraph, .err, .out.

module purge
module load cutadapt/1.18
module load fastx-toolkit/0.0.14
module load bowtie/1.2.2
module load gcc/8.2.0
module load samtools/1.9
module load bedtools/2.27.1

genome_index_prefix='/bgfs/ckaplan/2020_Tingting/BowtieIndexR64/genome'

fastq="*.fastq"

mkdir unaligned

echo "Fastq qulity filtering..."
for file in ${fastq}
do
base=$(basename ${file} _R1_001.fastq)
echo $file
fastq_quality_filter -v -q 20 -p 75 -i ${file} -o ${base}_filtered.fastq
done

fastq1="*filtered.fastq"
for file1 in ${fastq1}
do
wc -l ${file1} > ${file1}wc.log
z=$(awk '{ c=$1; print c/4}' ${file1}wc.log)
echo $file1: $z reads
rm ${file1}wc.log
done


echo "Trimming adaptor..."
for file1 in ${fastq1}
do
base1=$(basename ${file1} _filtered.fastq)
echo $file1
cutadapt -u 6 -o ${base1}_cut6.fastq ${file1}
done

fastq2="*cut6.fastq"
for file2 in ${fastq2}
do
wc -l ${file2} > ${file2}wc.log
z=$(awk '{ c=$1; print c/4}' ${file2}wc.log)
echo $file2: $z reads
rm ${file2}wc.log
done


echo "Trimming to 35..."
for file2 in ${fastq2}
do
base2=$(basename ${file2} _cut6.fastq)
echo $file2
cutadapt -l 35 --minimum-length=35 -o ${base2}_cut6to35exact.fastq ${file2}
done


echo "Bowtie alignment..."
fastq3="*cut6to35exact.fastq"
for file3 in ${fastq3}
do
base3=$(basename ${file3} _cut6to35exact.fastq)
echo $file3
bowtie -p3 -v2 -m1 -q --sam --un ${base3}_unaligned.sam $genome_index_prefix ${file3} > ${base3}.sam
done

echo "move unaligend sam"
unaligned="*_unaligned.sam"
for file33 in ${unaligned}
do
mv ${file33} unaligned/
done

echo "Extracting unique reads..."
aligned="*.sam"
for file4 in ${aligned}
do
base4=$(basename ${file4} .sam)
echo $file4
samtools view -F 4 -S -b ${file4} > ${base4}_unique.bam
done

echo "bam to sorted.bam..."
bamfile="*.bam"
for file5 in ${bamfile}
do
base5=$(basename ${file5} _unique.bam)
echo $file5
samtools sort -o ${base5}_unique_sorted.bam ${file5}
done


echo "sortedbam to bed..."
bamfile="*_sorted.bam"
for file6 in ${bamfile}
do
base6=$(basename ${file6} _unique_sorted.bam)
echo $file6
bedtools bamtobed -cigar -i ${file6} > ${base6}_unique.bed
done


echo "grab 5 prime end from bed..."
bedfile="*.bed"
for file7 in ${bedfile}
do
base7=$(basename ${file7} _unique.bed)
echo $file7
awk 'BEGIN{FS=OFS="\t"} $6=="+" {$3=$2+1} $6=="-" {$2=$3-1} {print}' ${file7} > ${base7}_unique_awk.bed
done

echo "awkbed to bedgraph..."
awkfile="*_awk.bed"
for file8 in ${awkfile}
do
base8=$(basename ${file8} _unique_awk.bed)
echo $file8
bedtools genomecov -g R64.new.genome -i ${file8} -bg -strand - > ${base8}_rs.bedgraph
bedtools genomecov -g R64.new.genome -i ${file8} -bg -strand + > ${base8}_fs.bedgraph
done
