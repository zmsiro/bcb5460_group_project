# RNAseq Data Sources
The raw data used in the Bottomly et al. (2011) paper are publicly available.
The raw sequencing data are not stored on our GitHub due to size constraints but are linked here.

## Dataset Information
**Study:** Bottomly et al. (2011), PLoS ONE
**Organism:* Mus musculus, mouse
**Tissue:** mouse striatum
**Strains:** C57BL/6J ("B6"), DBA/2J ("D2")

## SRA Accession
**SRA Study:** SRA026846
**Link:** https://www.ncbi.nlm.nih.gov/sra/?term=SRA026846

### Download Instructions
Data were downloaded on the Iowa State University Nova HPC cluster utilizing SRA Toolkit.
Example:
```bash
# Create directory
mkdir -p fastq
cd fastq

# Download using prefetch (using example SR)
prefetch SRR099223

# Convert to FASTQ
fasterq-dump SRR099223
```
The full list of SRA run accessions is available in SRR_Acc_List.txt

## Data information
The data are single-end reads
FASTQ files were kallisto quantification input

## To reproduce this analysis:
- Download raw FASTQ files from the SRA accession provided above (or through link above)
- Kallisto pipeline in rna_seq/code/ should be run
- DE analysis can be run utilizing the R scripts within the repository (tximport, DESeq2)