library(DESeq2)
library(readr)
library(tximport)
dir <- "/Volumes/JetStream/Thesis_Raw_Data/"
samples <- read.table(file.path(dir, "samples_1.txt"), header = TRUE)
files <- file.path(dir, samples$run, "quant.sf")
txdb <- makeTxDbFromGFF("/Volumes/JetStream/Thesis_Raw_Data/Homo_sapiens/ENSEMBL/Homo_sapiens.GRCh38.95.gtf")
k <- keys(txdb, keytype ="TXNAME")
tx2gene <- select(txdb, k, "GENEID", "TXNAME")
names(files) <- paste0("sample", 1:6)
all(file.exists(files))
txi <- tximport(files, type = "salmon", tx2gene = tx2gene, ignoreTxVersion = TRUE)
ddsTxi <- DESeqDataSetFromTximport(txi,colData = samples, design = ~ condition)
dds <- DESeq(ddsTxi)
res <- results(dds)
res