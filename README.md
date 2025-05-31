# RNA-Seq Alignment with STAR (Using Docker)

This repository demonstrates a minimal working example of aligning RNA-Seq reads to a toy genome using [STAR](https://github.com/alexdobin/STAR) inside a Docker container.

## Project Structure

- `Dockerfile`: Installs STAR and dependencies
- `scripts/run_star.sh`: Runs genome generation and alignment
- `data/`: Toy genome, GTF, and FASTQ files
- `output/`: Alignment results (not tracked by Git)

## How to Use

```bash
docker build -t star-docker .
```

### Run the STAR alignment
docker run --rm \
  -v $(pwd)/output:/app/output \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/scripts:/app/scripts \
  star-docker bash scripts/run_star.sh


## Example Data
- toy_genome.fa: A tiny artificial reference genome
- toy_genes.gtf: A GTF annotation file with a single exon
- sample.fastq: A single-end FASTQ file with 1 read

## Output Files
After running the pipeline, the output/ directory will contain:
  - Aligned.sortedByCoord.out.bam: Final aligned BAM file
  - Log.out: STAR alignment log
  - SJ.out.tab: Splice junction output (empty for toy example)

## Notes
- The FASTQ file must have equal-length sequence and quality lines
- The GTF file must contain exon features with coordinates that match the FASTA reference
- STAR is compiled and run inside the container using Ubuntu 20.04

## License
MIT License. Use and modify freely.
