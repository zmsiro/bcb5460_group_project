# Download Notes

The raw RNAseq data were downloaded from NCBI SRA accession SRA026846 and processed on the ISU Nova HPC cluster.

Overall steps:
1. Find the SRR accession list
2. Download FASTQ files from SRA
3. Build a kallisto index from the mouse transcriptome
4. Run kallisto on each samples (can submit slurm)
5. Import abundance files into R for downstream analysis