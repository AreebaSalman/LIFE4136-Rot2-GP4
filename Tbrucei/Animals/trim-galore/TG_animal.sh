#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=23:00:00
#SBATCH --job-name=TG_animal2
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_animal2/%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_animal2/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate RNAseq

# Path to our files
file_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4
out_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_animal2

# Trim data
for n in {1..5}; do
    trim_galore --quality 28 --length 40 $file_dir/Animal${n}.fastq.gz -o $out_dir
done

# Deactivate conda environment
conda deactivate
