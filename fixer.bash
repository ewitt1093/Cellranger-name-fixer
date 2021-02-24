#!/bin/bash

tsv=$1
gtf=$2


cp $tsv featuresbackup.tsv
cat  $gtf |grep FBgn | awk '{if ($3=="gene") print $10, $12}' | sed 's/"//g' | sed 's/;//g' |sort -u >featurenames.txt


Rscript merged_and_ordered.R features.tsv featurenames.txt features2.tsv


i=$(wc -l featuresbackup.tsv|awk '{print $1}' )
tail -n $i features2.tsv | sed 's/"//g' | awk -v OFS='\t' '{if ($4 != "NA") print $2, $4; else if ($4 == "NA") print $2, $2 }' > features3.tsv
cp features3.tsv $1
rm featurenames.txt
rm features2.tsv
rm features3.tsv
