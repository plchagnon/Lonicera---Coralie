rm(list=ls())
load("OutputITS.RData")
x=seqtab.nochim

### Extract sample names
rownames(x)=sapply(strsplit(rownames(x),"-ITS"),'[',1)

### Remove Amy's samples
y=x[rownames(x)%in%1:50,]

### Place rows in numeric order
y=y[order(as.numeric(rownames(y))),]

### Remove sites with too few reads
z=y[rowSums(y)>5000,]

### Remove fungi that have NO occurrences in the reduced dataset
comm=z[,!colSums(z)==0]

### Remove these fungi from the taxonomy table too
taxa=taxa[!colSums(z)==0,]

### Rarefy samples to the same sequencing depth
library(vegan)
comm=rrarefy(comm,32912)

### Export the reduced dataset
rm(list=setdiff(ls(),c("comm","taxa")))
save.image("Coralie ITS.RData")


