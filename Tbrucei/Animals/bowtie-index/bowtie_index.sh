#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --job-name=bowtie_index
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference1/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference1/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Bowtie2

bowtie2-build /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference1/TriTrypDB-68_TbruceiTREU927_Genome.fasta /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference1

conda deactivate
