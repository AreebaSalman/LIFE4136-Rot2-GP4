#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=23:00:00
#SBATCH --job-name=bowtie_trim_vitro
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie1_vitro/logs/vitro%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie1_vitro/logs/vitro%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate Bowtie2

# Paths
vitro_trim=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_vitro1
index_ref=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group3/bowtie_index/index/bowtie_index
output_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie1_vitro

# Create output directory if it doesn't exist
mkdir -p $output_dir

# Align unpaired animal trimmed reads to indexed reference
for n in {1..5}; do
    bowtie2 -x $index_ref -U $vitro_trim/In_vitro${n}_trimmed.fq.gz -N 1 -p 8 --un $output_dir/unmapped${n}.fq -S $output_dir/mapped${n}.sam
done

# Deactivate conda environment
conda deactivate
