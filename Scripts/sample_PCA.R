#### Script to generate histograms, MA plots, and Dispersion Estimates from res and dds ####

hist (res$padj, breaks=20, col="grey")
plotMA(res, ylim = c(-1, 1))
plotDispEsts(dds)

#PCA of samples
rld <- vst(dds)
ramp <- 1:3/3
cols <- c(rgb(ramp, 0, 0),
          rgb(0, ramp, 0),
          rgb(0, 0, ramp),
          rgb(ramp, 0, ramp))
print ( plotPCA( rld, intgroup = c("Condition")))