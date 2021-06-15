#!/bin/bash

#SBATCH --job-name=FastqConcatVV
#SBATCH -N 1
#SBATCH --ntasks-per-node=4
#SBATCH --time=0-01:00:00                     # 6 days walltime in dd-hh:mm format
#SBATCH --mem=64g
#SBATCH --output=out%j.out
#SBATCH --error=err%j.err

# This is the script used to merge sequencing data by library. Some sequencing data were collected from different lanes. By Tingting Zhao.
# To run on Pitt supercomputing system: sbatch .sh
# Input: fastq
# Output: fastq, .err, .out.

module purge

cat Vv1546_S1_L001_R1_001.fastq Vv1546_S1_L002_R1_001.fastq Vv1546_S1_L003_R1_001.fastq Vv1546_S1_L004_R1_001.fastq > Vv1546_S1_R1_001.fastq
cat Vv1547_S2_L001_R1_001.fastq  Vv1547_S2_L002_R1_001.fastq  Vv1547_S2_L003_R1_001.fastq  Vv1547_S2_L004_R1_001.fastq > Vv1547_S2_R1_001.fastq
cat Vv1548_S3_L001_R1_001.fastq  Vv1548_S3_L002_R1_001.fastq  Vv1548_S3_L003_R1_001.fastq  Vv1548_S3_L004_R1_001.fastq > Vv1548_S3_R1_001.fastq
cat Vv1549_S4_L001_R1_001.fastq  Vv1549_S4_L002_R1_001.fastq  Vv1549_S4_L003_R1_001.fastq  Vv1549_S4_L004_R1_001.fastq > Vv1549_S4_R1_001.fastq
cat Vv1550_S5_L001_R1_001.fastq  Vv1550_S5_L002_R1_001.fastq  Vv1550_S5_L003_R1_001.fastq  Vv1550_S5_L004_R1_001.fastq > Vv1550_S5_R1_001.fastq
cat Vv1551_S6_L001_R1_001.fastq  Vv1551_S6_L002_R1_001.fastq  Vv1551_S6_L003_R1_001.fastq  Vv1551_S6_L004_R1_001.fastq > Vv1551_S6_R1_001.fastq
cat Vv1552_S7_L001_R1_001.fastq  Vv1552_S7_L002_R1_001.fastq  Vv1552_S7_L003_R1_001.fastq  Vv1552_S7_L004_R1_001.fastq > Vv1552_S7_R1_001.fastq
cat Vv1553_S8_L001_R1_001.fastq  Vv1553_S8_L002_R1_001.fastq  Vv1553_S8_L003_R1_001.fastq  Vv1553_S8_L004_R1_001.fastq > Vv1553_S8_R1_001.fastq
cat Vv1554_S9_L001_R1_001.fastq  Vv1554_S9_L002_R1_001.fastq  Vv1554_S9_L003_R1_001.fastq  Vv1554_S9_L004_R1_001.fastq > Vv1554_S9_R1_001.fastq
cat Vv1555_S10_L001_R1_001.fastq  Vv1555_S10_L002_R1_001.fastq  Vv1555_S10_L003_R1_001.fastq  Vv1555_S10_L004_R1_001.fastq > Vv1555_S10_R1_001.fastq
cat Vv1556_S11_L001_R1_001.fastq  Vv1556_S11_L002_R1_001.fastq  Vv1556_S11_L003_R1_001.fastq  Vv1556_S11_L004_R1_001.fastq > Vv1556_S11_R1_001.fastq
cat Vv1557_S12_L001_R1_001.fastq  Vv1557_S12_L002_R1_001.fastq  Vv1557_S12_L003_R1_001.fastq  Vv1557_S12_L004_R1_001.fastq > Vv1557_S12_R1_001.fastq

cat Vv1558_S1_L001_R1_001.fastq Vv1558_S1_L002_R1_001.fastq Vv1558_S1_L003_R1_001.fastq Vv1558_S1_L004_R1_001.fastq > Vv1558_S1_R1_001.fastq
cat Vv1559_S2_L001_R1_001.fastq  Vv1559_S2_L002_R1_001.fastq  Vv1559_S2_L003_R1_001.fastq  Vv1559_S2_L004_R1_001.fastq > Vv1559_S2_R1_001.fastq
cat Vv1560_S3_L001_R1_001.fastq  Vv1560_S3_L002_R1_001.fastq  Vv1560_S3_L003_R1_001.fastq  Vv1560_S3_L004_R1_001.fastq > Vv1560_S3_R1_001.fastq
cat Vv1561_S4_L001_R1_001.fastq  Vv1561_S4_L002_R1_001.fastq  Vv1561_S4_L003_R1_001.fastq  Vv1561_S4_L004_R1_001.fastq > Vv1561_S4_R1_001.fastq
cat Vv1562_S5_L001_R1_001.fastq  Vv1562_S5_L002_R1_001.fastq  Vv1562_S5_L003_R1_001.fastq  Vv1562_S5_L004_R1_001.fastq > Vv1562_S5_R1_001.fastq
cat Vv1563_S6_L001_R1_001.fastq  Vv1563_S6_L002_R1_001.fastq  Vv1563_S6_L003_R1_001.fastq  Vv1563_S6_L004_R1_001.fastq > Vv1563_S6_R1_001.fastq
cat Vv1564_S7_L001_R1_001.fastq  Vv1564_S7_L002_R1_001.fastq  Vv1564_S7_L003_R1_001.fastq  Vv1564_S7_L004_R1_001.fastq > Vv1564_S7_R1_001.fastq
cat Vv1565_S8_L001_R1_001.fastq  Vv1565_S8_L002_R1_001.fastq  Vv1565_S8_L003_R1_001.fastq  Vv1565_S8_L004_R1_001.fastq > Vv1565_S8_R1_001.fastq
cat RE1566_S1_L001_R1_001.fastq  RE1566_S1_L002_R1_001.fastq  RE1566_S1_L003_R1_001.fastq  RE1566_S1_L004_R1_001.fastq > Vv1566_S1_R1_001.fastq
cat Vv1567_S10_L001_R1_001.fastq  Vv1567_S10_L002_R1_001.fastq  Vv1567_S10_L003_R1_001.fastq  Vv1567_S10_L004_R1_001.fastq > Vv1567_S10_R1_001.fastq
