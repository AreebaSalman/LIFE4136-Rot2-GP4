#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=23:00:00
#SBATCH --job-name=align_trim_animal
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie/logs/%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie/logs/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate bowtie2

# Paths
animal_trim=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_animal
index_ref=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie_index/reference
output_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie/animal2

# Align unpaired animal trimmed reads to indexed reference
for n in {1..5}; do
    bowtie2 -x $index_ref -U $animal_trim/Animal${n}_trimmed.fq -N 1 -p 8 --un $output_dir/animal${n} -S $output_dir/animal${n}_trim.sam
done

# Deactivate conda environment
conda deactivate

