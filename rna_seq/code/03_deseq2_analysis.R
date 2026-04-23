# RNA-seq differential expression analysis for Bottomly et al. replication

# Load appropriate libraries
library(tximport)
library(DESeq2)
library(ggplot2)
library(readr)
library(biomaRt)

# Load the sample metadata
samples <- read.table("rna_seq/data/studydesign.txt", header = TRUE, stringsAsFactors = FALSE)
samples$condition <- factor(samples$condition, levels = c("B6", "D2"))

# Define the kallisto abundance files
files <- file.path("kallisto_results", samples$sample, "abundance.tsv")
names(files) <- samples$sample

# Build transcript-to-gene maps
mart <- useEnsembl(biomart = "genes", dataset = "mmusculus_gene_ensembl")
tx2gene <- getBM(
  attributes = c("ensembl_transcript_id", "ensembl_gene_id"),
  mart = mart
)
colnames(tx2gene) <- c("TXNAME", "GENEID")

# Import transcript abundances --> summarize to gene level
txi <- tximport(
  files,
  type = "kallisto",
  tx2gene = tx2gene,
  ignoreTxVersion = TRUE
)

# Create DESeq2 object
dds <- DESeqDataSetFromTximport(
  txi,
  colData = samples,
  design = ~ condition
)

# Run DE analysis
dds <- DESeq(dds)
res <- results(dds)

# Save results
write.csv(as.data.frame(res), "rna_seq/results/tables/deseq2_results.csv")

# Save session info
writeLines(capture.output(sessionInfo()), "rna_seq/results/session_info.txt")