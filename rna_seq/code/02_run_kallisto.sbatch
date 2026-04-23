#!/bin/bash
#SBATCH --job-name=bottomly_kallisto
#SBATCH --account=mkohut # change to your account
#SBATCH --qos=normal
#SBATCH --time=08:00:00
#SBATCH --nodes=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=32G
#SBATCH --output=kallisto_%j.out
#SBATCH --error=kallisto_%j.err

set -euo pipefail

source /work/mkohut/shared_software/miniconda/etc/profile.d/conda.sh # change to your conda software
conda activate rnaseq

cd /work/mkohut/zmsiro/bottomly_project # change to your directory

for file in fastq/*.fastq; do
  sample=$(basename "$file" .fastq)
  echo "Running $sample"
  kallisto quant \
    -i reference/mouse_cdna.index \
    -o kallisto_results/$sample \
    --single -l 250 -s 30 \
    "$file"
done