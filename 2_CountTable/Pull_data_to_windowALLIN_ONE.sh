## Syntax: bash Pull_data_to_windowALLIN_ONE.sh <gff file> <plus.bedgraph> <minus.bedgraph>

## This script is to take a gff (window file), plus strand bedgraph and minus strand bedgraph to generate a 5979x401 matrix (5979 promoters, 401 positions).
## This script has to work with Pull_data_all_in_one.R in the same directory (not in the same PATH directory).

awk 'BEGIN{FS=OFS="\t"}{print $1,$4,$5,$7}' $1 > temp1.txt
awk 'BEGIN{FS=OFS="\t"}{$5="+"}{print}' $2 > temp2.txt
awk 'BEGIN{FS=OFS="\t"}{$5="-"}{print}' $3 > temp3.txt
cat temp2.txt temp3.txt > temp4.txt

Rscript Pull_data_to_windowALLIN_ONE.R temp4.txt temp1.txt

mv temp5.txt $2_$3_$1.csv

rm temp1.txt
rm temp2.txt
rm temp3.txt
rm temp4.txt
