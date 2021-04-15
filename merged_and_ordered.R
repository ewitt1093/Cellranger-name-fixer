#!/usr/bin/env Rscript
library(plyr)
args = commandArgs(trailingOnly=TRUE)
 features <-read.table(args[1])
names(features)<-c("ID","ID2")
 names <-read.table(args[2])
names(names)<-c("ID","gene")
features<-join(features, names, by="ID")
features<-features[,c("ID","gene")]
features$type<-"Gene Expression"

library(dplyr)

features <- features %>% mutate(gene = coalesce(gene, ID))

#features$gene <- ifelse(is.na(features$gene), features$ID, features$gene)
write.table(features, file=args[3], quote=FALSE, sep='\t', col.names = F, row.names=F)
