# Base image
FROM ubuntu:20.04

# Prevent timezone selection prompt during build
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata

# Install dependencies
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libbz2-dev \
    liblzma-dev \
    samtools \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o STAR.tar.gz https://github.com/alexdobin/STAR/archive/2.7.10a.tar.gz && \
    tar -xvzf STAR.tar.gz && \
    cd STAR-2.7.10a/source && \
    sed -i 's/-mavx2//g' Makefile && \
    sed -i 's/-fopenmp//g' Makefile && \
    make STAR && \
    cp STAR /usr/local/bin && \
    cd ../../ && rm -rf STAR*


WORKDIR /app

COPY scripts/ scripts/
COPY data/ data/

RUN mkdir output

CMD ["bash", "scripts/run_star.sh"]

