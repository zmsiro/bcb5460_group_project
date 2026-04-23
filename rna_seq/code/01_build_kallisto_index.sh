#!/bin/bash
set -euo pipefail

# Below is an example - change to your user ID and appropriate path
cd /work/mkohut/zmsiro/bottomly_project/reference 
kallisto index -i mouse_cdna.index Mus_musculus.GRCm39.cdna.all.fa.gz