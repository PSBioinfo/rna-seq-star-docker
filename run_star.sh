#!/bin/bash
set -e

# Paths
GENOME_DIR="output/genome_index"
DATA_DIR="data"
OUTPUT_DIR="output"

# Create genome index
STAR --runThreadN 2 \
     --runMode genomeGenerate \
     --genomeDir $GENOME_DIR \
     --genomeFastaFiles $DATA_DIR/toy_genome.fa \
     --sjdbGTFfile $DATA_DIR/toy_genes.gtf \
     --sjdbOverhang 20

# Run STAR alignment
STAR --runThreadN 2 \
     --genomeDir $GENOME_DIR \
     --readFilesIn $DATA_DIR/sample.fastq \
     --outFileNamePrefix $OUTPUT_DIR/ \
     --outSAMtype BAM SortedByCoordinate


