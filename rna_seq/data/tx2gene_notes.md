# Transcript-to-Gene Mapping (using tx2gene)

## Overview

The RNAseq kallisto quantification produces estimates of expression at the trancsript level
To perform at the gene level, we performed a transcript-to-gene mapping step (tx2gene)

## Source of Annotation

We obtained transcript-to-gene mappings from the Ensembl database through the R package biomaRt

- Organism: *Mus musculus*
- Database: Ensembl
- Dataset: `mmusculus_gene_ensembl`

---

## Code Used

```r
library(biomaRt)

mart <- useEnsembl(biomart = "genes", dataset = "mmusculus_gene_ensembl")

tx2gene <- getBM(
  attributes = c("ensembl_transcript_id", "ensembl_gene_id"),
  mart = mart
)

colnames(tx2gene) <- c("TXNAME", "GENEID")