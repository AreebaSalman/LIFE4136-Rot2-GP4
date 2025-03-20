#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --job-name=trim_galore
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_vitro1/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/TG_vitro1/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate Areeba

cd /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/

for file in In_vitro*.fastq.gz; do
    trim_galore --quality 28 --length 40 "$file" -o TG_vitro1
done

conda deactivate
