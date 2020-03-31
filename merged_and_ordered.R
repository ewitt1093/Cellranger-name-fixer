#!/usr/bin/env Rscript
library(plyr)
args = commandArgs(trailingOnly=TRUE)
 genes <-read.table(args[1])
 names <-read.table(args[2])
genes<-join(genes, names, by="V1")
genes<-genes[,c(1,5,3)]
genes$V3<-"Gene Expression"
write.table(genes, file=args[3])
