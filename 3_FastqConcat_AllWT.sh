#!/bin/bash

#SBATCH --job-name=FastqConcatAllWT
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --time=0-01:00:00                     # 6 days walltime in dd-hh:mm format
#SBATCH --mem=64g
#SBATCH --output=out%j.out
#SBATCH --error=err%j.err

# This is the script used to merge all WT sequencing data, from both RPB1 WT and SSL2 WT strains, into a single WT file. By Tingting Zhao.
# To run on Pitt supercomputing system: sbatch .sh
# Input: fastq
# Output: fastq, .err, .out.

module purge

cat VV1419_S11_R1_001.fastq VV1420_S12_R1_001.fastq VV1421_S13_R1_001.fastq VV1422_S14_R1_001.fastq Vv1546_S1_L001_R1_001.fastq Vv1546_S1_L002_R1_001.fastq Vv1546_S1_L003_R1_001.fastq Vv1546_S1_L004_R1_001.fastq Vv1547_S2_L001_R1_001.fastq  Vv1547_S2_L002_R1_001.fastq  Vv1547_S2_L003_R1_001.fastq  Vv1547_S2_L004_R1_001.fastq Vv1548_S3_L001_R1_001.fastq  Vv1548_S3_L002_R1_001.fastq  Vv1548_S3_L003_R1_001.fastq  Vv1548_S3_L004_R1_001.fastq Vv1558_S1_L001_R1_001.fastq Vv1558_S1_L002_R1_001.fastq Vv1558_S1_L003_R1_001.fastq Vv1558_S1_L004_R1_001.fastq Vv1555_S10_L001_R1_001.fastq  Vv1555_S10_L002_R1_001.fastq  Vv1555_S10_L003_R1_001.fastq  Vv1555_S10_L004_R1_001.fastq Vv1565_S8_L001_R1_001.fastq  Vv1565_S8_L002_R1_001.fastq  Vv1565_S8_L003_R1_001.fastq  Vv1565_S8_L004_R1_001.fastq > WT_S1_R1_001.fastq

