# Microarray figures (Bottomly et al., 2011 replication)

# Load libraries
library(GEOquery)
library(limma)
library(ggplot2)
library(pheatmap)

# 1. Load GEO dataset

gse_list <- getGEO("GSE26024", GSEMatrix = TRUE)

# Illumina platform
eset <- gse_list[[2]]

expr <- exprs(eset)
pheno <- pData(eset)


# 2. Create strain variable

pheno$strain <- ifelse(grepl("_B6", pheno$title), "B6",
                ifelse(grepl("_D2", pheno$title), "D2", NA))

pheno$strain <- factor(pheno$strain, levels = c("B6", "D2"))


# 3. limma differential expression

design <- model.matrix(~ strain, data = pheno)

fit <- lmFit(expr, design)
fit <- eBayes(fit)

res <- topTable(fit, coef = "strainD2", number = Inf)


# 4. PCA plot

pca <- prcomp(t(expr), scale. = TRUE)

pca_df <- data.frame(
  PC1 = pca$x[, 1],
  PC2 = pca$x[, 2],
  strain = pheno$strain
)

p_pca <- ggplot(pca_df, aes(PC1, PC2, color = strain)) +
  geom_point(size = 3) +
  theme_bw() +
  ggtitle("Microarray PCA")

ggsave(
  filename = "microarray/results/figures/pca_plot.png",
  plot = p_pca,
  width = 6,
  height = 5
)


# 5. Volcano plot

res$negLog10FDR <- -log10(res$adj.P.Val)

p_volcano <- ggplot(res, aes(logFC, negLog10FDR)) +
  geom_point(alpha = 0.5) +
  theme_bw() +
  ggtitle("Microarray Volcano Plot")

ggsave(
  filename = "microarray/results/figures/volcano_plot.png",
  plot = p_volcano,
  width = 6,
  height = 5
)


# 6. Heatmap of top 50 probes only

top_idx <- head(order(res$adj.P.Val), 50)
mat <- expr[rownames(res)[top_idx], ]
mat <- mat - rowMeans(mat)

ann <- data.frame(strain = pheno$strain)
rownames(ann) <- rownames(pheno)

png("microarray/results/figures/heatmap.png", width = 900, height = 800)
pheatmap(mat, annotation_col = ann)
dev.off()