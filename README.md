# BCB5460 Group Project – Bottomly RNA-seq and Microarray Replication

## Overview
This repository contains our group project for BCB 5460 (Spring 2026), where we replicate and document analyses from:

Bottomly et al. (2011), PLoS ONE

The original study compared gene expression in mouse striatum between two strains:
- C57BL/6J (B6)
- DBA/2J (D2)

## Project Structure

This repository is divided into two main components:

### RNA-seq analysis
Located in `rna_seq/`

Includes:
- kallisto quantification
- tximport gene summarization
- DESeq2 differential expression
- visualization (PCA, MA, volcano, heatmap)

### Microarray analysis
Located in `microarray/`

(In progress)

## Data
Raw data are NOT stored in this repository due to size limits.

RNA-seq data are available from:
https://www.ncbi.nlm.nih.gov/sra/?term=SRA026846.1

## Key Result
We identified ~1,200 differentially expressed genes (padj < 0.01), consistent with the original study’s findings.

## Goal of Project
To reconstruct and document a computational workflow for an under-documented study, making it reproducible and interpretable.

## Authors
Katie, Nathan, Shamima, Zoe
