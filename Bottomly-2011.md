# Bottomly et al. (2011) Replication Summary

## Original Study
Bottomly et al. (2011) compared gene expression in mouse striatum between two strains:
- C57BL/6J (B6)
- DBA/2J (D2)

The study used both RNA-seq and microarray approaches.

## RNA-seq Methods (Original)
- Alignment: Bowtie
- Counting: exon-level summarization
- Analysis: edgeR

## Our Replication Approach

We used a modern RNA-seq workflow:

- kallisto (pseudoalignment)
- tximport (gene-level summarization)
- DESeq2 (differential expression)

## Key Differences
- Modern tools instead of legacy pipeline
- Updated annotations
- No microarray comparison (yet)

## Results
Original paper:
- ~1,727 DE genes (q < 0.01)

Our replication:
- ~1,219 DE genes (padj < 0.01)

## Interpretation
Despite methodological differences, we reproduced the same overall biological conclusion:
strong gene expression differences exist between B6 and D2 mouse striatum.

## Limitations
- Did not replicate microarray analysis
- Different computational pipeline
- Different reference annotation

## Conclusion
The main findings of the study are robust to a modern RNA-seq workflow, and our documentation improves reproducibility.
