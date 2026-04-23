# Microarray workflow overview

## Our goal is to replicate the microarray DE analysis from Bottomly et al. (2011)



## Original study workflow

The study analyzed two platforms:
- Affymetrix Mouse Genome 430 2.0
- Illumina MouseRef-8 v2.0

The methods performed in Bottomly et al. (2011) included:
- normalization (which was platform-specific)
- probe filtering
- DE using limma

---

## Our workflow

We utilized the following  pipeline:
GEO → GEOquery → limma → visualization

# Step 1. Data acquisition
- Source: GEO
- Accession: GSE26024

# Step 2. Data processing
- Used processed expression matrices (from GEO)
- Used Illumina platform (GPL6885)

# Step 3. Differential expression
- Tool: limma
- Model based on strain of mouse striatum (B6 vs D2)

# Step 4. Visualization
- PCA plot
- Volcano plot
- Heatmap

# Primary results
- 1226 differentially expressed genes (FDR < 0.01)
- Bottomly et al. (2011) found 869 genes < 0.01

# Overall same conclusion that there is substantial DE between B6 and D2 mouse striatums
# Also consistent with the RNAseq findings