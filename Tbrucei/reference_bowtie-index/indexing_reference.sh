#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --job-name=quast
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate bowtie2 

bowtie2-build --large-index /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference/TriTrypDB-68_TbruceiTREU927_Genome.fasta  /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference

conda deactivate
