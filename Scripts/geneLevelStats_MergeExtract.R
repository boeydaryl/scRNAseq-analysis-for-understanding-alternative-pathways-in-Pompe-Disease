#Script to merge and extract p1p2p3vsIM90 genes in common, extracting l2fc and padj from p1
library(plyr)

#### Loading the relevant CSV files #####

common_genes <- read.csv("/Volumes/scRNAseq_1/Compiled_Analysis/p1p2p3vsIM90/p0.01/p1p2p3vsIM90_common.csv", header = TRUE)
p1_geneLevelStats <- read.csv("/Volumes/scRNAseq_1/P1_vs_IM90/Analysis/geneLevelStats_p1vsIM90.csv", header = TRUE, row.names = "X")

#### Merging from p1_geneLevelStats to common_genes ####

common_geneLevelStats <- match_df(p1_geneLevelStats, common_genes, on ="ensembl")
write.csv(common_geneLevelStats, file = "/Volumes/scRNAseq_1/Compiled_Analysis/p1p2p3vsIM90/p0.01/commonGeneLevelStats_exP1.csv")