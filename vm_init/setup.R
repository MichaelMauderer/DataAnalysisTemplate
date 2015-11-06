#!/usr/bin/Rscript

chooseCRANmirror(ind=2)
update.packages(ask=FALSE)

list.of.packages <- c("ez", "pwr")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages, dep=TRUE)