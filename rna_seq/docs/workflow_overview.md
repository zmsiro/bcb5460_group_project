# RNA-seq Workflow Overview

# Goal is to reproduce the RNAseq DE analysis from Bottomly et al. (2011), using more modern tools

## The original study, Bottomly et al. (2011) used:
FASTQ → Bowtie (for alignment) → exon-based summaries (read counts) → edgeR (DE analysis)

## Our workflow
FASTQ → kallisto → tximport → DESeq2 → visualization

## Steps performed:
1. Download RNA-seq data from SRA
    -RNAseq data downloaded from NCBI SRA (Accession: SRA026846)
    -Downloaded on Iowa State University Nova HPC cluster
2. Transcript quantification using kallisto
    -Pseudoalignment
    -Output: transcript-level estimates of abundance
3. Summarization at gene-level using tximport in R
    - transcript-to-gene mapping
    - transcript-level estimates --> gene-level counts
4. Differential expression analysis using DESeq2 (in R)
    -Modeled based on condition (B6 compared to D2 mouse striatum)
5. Visualized results
    -PCA plot: sample clustering by mouse striatum (B6 cs D2)
    -MA plot: mean expression vs fold change
    -Volcano plot: effect size vs statistical significance
    -Heatmap: to visualize top DE genes

## Why we used this approach
The original paper did not provide a reproducible pipeline that could be used with current tools. 
We implemented a more modern RNA-seq workflow that can be reproduced and used.
