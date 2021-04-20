#!/bin/bash

tsv=$1
gtf=$2


cp $tsv featuresbackup.tsv
cat  $gtf |grep FBgn | awk '{if ($3=="gene") print $10, $12}' | sed 's/"//g' | sed 's/;//g' |sort -u >featurenames.txt


Rscript merged_and_ordered.R $1 featurenames.txt features2.tsv
