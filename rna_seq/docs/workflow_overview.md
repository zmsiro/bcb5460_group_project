# RNA-seq Workflow Overview

## Original study
FASTQ → Bowtie → gene counts → edgeR

## Our workflow
FASTQ → kallisto → tximport → DESeq2 → visualization

## Steps performed
1. Download RNA-seq data from SRA
2. Build kallisto index
3. Run kallisto quantification
4. Import into R using tximport
5. Run DESeq2
6. Generate figures (PCA, MA, volcano, heatmap)

## Why we used this approach
The original paper did not provide a reproducible pipeline. We implemented a modern RNA-seq workflow that is easier to reproduce and widely used today.
