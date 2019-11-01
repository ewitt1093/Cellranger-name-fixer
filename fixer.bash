#!/bin/bash

tsv=$1
gtf=$2


cp $tsv genesbackup.tsv
cat  $gtf |grep FBgn | awk '{if ($3=="gene") print $10, $12}' | sed 's/"//g' | sed 's/;//g' |sort -u >genenames.txt


Rscript merged_and_ordered.R genes.tsv genenames.txt genes2.tsv


i=$(wc -l genesbackup.tsv|awk '{print $1}' )
tail -n $i genes2.tsv | sed 's/"//g' | awk -v OFS='\t' '{if ($4 != "NA") print $2, $4; else if ($4 == "NA") print $2, $2 }' > genes3.tsv
cp genes3.tsv $1
rm genenames.txt
rm genes2.tsv
rm genes3.tsv
