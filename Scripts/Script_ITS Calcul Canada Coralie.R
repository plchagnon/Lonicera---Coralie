library(dada2)
path <- "./ITS"
list.files(path)
thr=20

fnFs <- sort(list.files(path, pattern="_R1_001.fastq", full.names = TRUE))
fnRs <- sort(list.files(path, pattern="_R2_001.fastq", full.names = TRUE))

sample.names <- sapply(strsplit(basename(fnFs), "_"), `[`, 1)

filtFs <- file.path(path, "filtered", paste0(sample.names, "_F_filt.fastq.gz"))
filtRs <- file.path(path, "filtered", paste0(sample.names, "_R_filt.fastq.gz"))
names(filtFs) <- sample.names
names(filtRs) <- sample.names

out <- filterAndTrim(fnFs, filtFs, fnRs, filtRs, 
		truncLen=c(250,200),
		trimLeft=c(19,20),
		maxN=0, 
		truncQ=2, 
		compress=TRUE, multithread=thr) 

errF <- learnErrors(filtFs, multithread=thr)
errR <- learnErrors(filtRs, multithread=thr)


dadaFs <- dada(filtFs, err=errF, multithread=thr)
dadaRs <- dada(filtRs, err=errR, multithread=thr)

mergers <- mergePairs(dadaFs, filtFs, dadaRs, filtRs, verbose=TRUE)

seqtab <- makeSequenceTable(mergers)

seqtab.nochim <- removeBimeraDenovo(seqtab, method="consensus", multithread=thr, verbose=TRUE)

getN <- function(x) sum(getUniques(x))
track <- cbind(out, sapply(dadaFs, getN), sapply(dadaRs, getN), sapply(mergers, getN), rowSums(seqtab.nochim))
colnames(track) <- c("input", "filtered", "denoisedF", "denoisedR", "merged", "nonchim")
rownames(track) <- sample.names
head(track)
write.table(track,"track.txt",row.names=F,col.names=F,sep="\t")

taxa <- assignTaxonomy(seqtab.nochim, "UNITE_9.0_2023-07-25.fasta", multithread=20)

save.image("OutputITS.RData")


