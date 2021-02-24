#!/usr/bin/env Rscript
library(plyr)
args = commandArgs(trailingOnly=TRUE)
 features <-read.table(args[1])
 names <-read.table(args[2])
features<-join(features, names, by="V1")
features<-features[,c(1,5,3)]
features$V3<-"Gene Expression"
features$V2 <- ifelse(is.na(features$V2), features$V1, features$V2)
write.table(features, file=args[3], quote=FALSE, sep='\t', col.names = NA, row.names=NA)
