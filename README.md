# RNA-Seq Alignment with STAR (Dockerized)

This repository demonstrates a minimal working example of aligning RNA-Seq reads to a toy genome using [STAR](https://github.com/alexdobin/STAR) inside a Docker container.

## 🔧 Structure

- `Dockerfile`: Installs STAR and dependencies
- `scripts/run_star.sh`: Runs genome generation and alignment
- `data/`: Toy genome, GTF, and FASTQ files
- `output/`: Alignment results (not tracked by Git)

## 🚀 Usage

```bash
docker build -t star-docker .

docker run --rm \
  -v $(pwd)/output:/app/output \
  -v $(pwd)/data:/app/data \
  -v $(pwd)/scripts:/app/scripts \
  star-docker bash scripts/run_star.sh

