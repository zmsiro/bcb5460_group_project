# BCB5460 Group Project – Bottomly et al. (2011) RNA-seq and Microarray Analysis Replication

## Overview
This repository contains documentation for our group project for BCB 5460 (Spring 2026).
In this repository, we replicate and document analyses from Bottomly et al. (2011; PLoS ONE)

## Original paper information
**Bottomly et al. (2011)**  
*Evaluating Gene Expression in C57BL/6J and DBA/2J Mouse Striatum Using RNA-Seq and Microarrays*  
PLoS ONE 6(3): e17820

## Research question
Bottomly et al. (2011) explored whether genes are differentially expressed between two mouse strains:
- C57BL/6J (B6)
- DBA/2J (D2)

## Project Structure
This repository is divided into two primary analysis components:

### RNA-seq analysis (located in `rna_seq/`)
- Data downloaded from SRA (SRA026846)
- Kallisto quantification
- Summarization at the gene level via tximport
- Differential expression as assessed through DESeq2
- Visualization of findings: PCA, MA, volcano plot, heatmap

### Microarray analysis (located in `microarray/`)
- Data were obtained through GEO (GSE26024)
- GEOquery and limma were utilized to perform analysis 
- Illumina MouseRef-8 v2.0 platform was used
- Visualization included PCA, volcano plot, heatmap


## Key Result
We found around 1,200 differentially expressed genes (padj < 0.01). 
While quantity differs compared to the original manuscript, the conclusions are similar
in that there appears to be notable gene expression differences in B6 and D2 mouse striatum

## Goal of Project
To provide documentation for a computational workflow for a poorly documented study,
making it more replicable.

## Repository Structure

bcb5460_group_project/
├── README.md
├── Bottomly-2011.md
├── rna_seq/
│   ├── code/
│   ├── data/
│   ├── docs/
│   └── results/
├── microarray/
│   ├── code/
│   ├── data/
│   ├── docs/
│   └── results/

## Data
Raw data are not stored in this repository.
RNA-seq data are available from: https://www.ncbi.nlm.nih.gov/sra/?term=SRA026846.1
    - SRA accession: SRA026846
Microarray data are available from: https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE26024
    - GEO accession: GSE26024

## Environments Used
RNAseq
-Nova HPC cluster (Iowa State University)
-kallisto
-R (tximport, DESeq2)
Microarray
-R (GEOquery, limma)

## Authors
Shamima Afrose, Katie Petersen, Nathan, Zoe Sirotiak
