# Microarray Differential Expression Analysis (Bottomly et al., 2011)

# Load libraries
library(GEOquery)
library(limma)

# 1. Loading GEO dataset

gse_list <- getGEO("GSE26024", GSEMatrix = TRUE)

# Choosing Illumina platform (GPL6885)
eset <- gse_list[[2]]


# 2. Extracting data

expr <- exprs(eset)
pheno <- pData(eset)


# 3. Creating strain variable

pheno$strain <- ifelse(grepl("_B6", pheno$title), "B6",
                ifelse(grepl("_D2", pheno$title), "D2", NA))

pheno$strain <- factor(pheno$strain, levels = c("B6", "D2"))

# Checking the created groups
print(table(pheno$strain))


# 4. Differential expression (limma)

design <- model.matrix(~ strain, data = pheno)

fit <- lmFit(expr, design)
fit <- eBayes(fit)

res <- topTable(fit, coef = "strainD2", number = Inf)


# 5. Summary

sig_genes <- sum(res$adj.P.Val < 0.01, na.rm = TRUE)

cat("Significant genes (FDR < 0.01):", sig_genes, "\n")


# 6. Save results

write.csv(res, "microarray/results/tables/limma_results.csv")