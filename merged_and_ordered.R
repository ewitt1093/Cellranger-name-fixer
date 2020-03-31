#!/usr/bin/env Rscript
library(plyr)
args = commandArgs(trailingOnly=TRUE)
 genes <-data.frame(read.table(args[1]))
 names <-data.frame(read.table(args[2]))
names(genes)<- c("gene", "short.name")
 names(names)<- c("gene", "short.name")
 merged_and_ordered <- join(genes, names, by="gene", type = "left")
write.table(merged_and_ordered, file=args[3])
