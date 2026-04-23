# Figure generation for Bottomly et al. (2011) RNA-seq replication

# Load relevant libraries
library(DESeq2)
library(ggplot2)
library(pheatmap)

# Assumes dds and res already exist in the environment - need to create if not
vsd <- vst(dds, blind = FALSE)

# PCA plot
pca <- plotPCA(vsd, intgroup = "condition", returnData = TRUE)
p <- ggplot(pca, aes(PC1, PC2, color = condition)) +
  geom_point(size = 3) +
  theme_bw() +
  ggtitle("RNA-seq PCA")
ggsave("rna_seq/results/figures/pca_plot.png", p, width = 6, height = 5)

# MA plot
png("rna_seq/results/figures/ma_plot.png", width = 800, height = 600)
plotMA(res, main = "MA Plot", ylim = c(-5, 5))
dev.off()

# Volcano plot
res_df <- as.data.frame(res)
res_df <- subset(res_df, !is.na(padj) & !is.na(log2FoldChange))
res_df$negLog10FDR <- -log10(res_df$padj)

volcano <- ggplot(res_df, aes(log2FoldChange, negLog10FDR)) +
  geom_point(alpha = 0.5) +
  theme_bw() +
  ggtitle("Volcano Plot")
ggsave("rna_seq/results/figures/volcano_plot.png", volcano, width = 6, height = 5)

# Heatmap of top 50 genes, can change number below
top_genes <- head(order(res$padj), 50)
mat <- assay(vsd)[top_genes, ]
mat <- mat - rowMeans(mat)
annotation <- as.data.frame(colData(vsd)[, "condition", drop = FALSE])

pheatmap(
  mat,
  annotation_col = annotation,
  filename = "rna_seq/results/figures/heatmap.png"
)