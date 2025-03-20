#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=24:00:00
#SBATCH --job-name=quast_Animals
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk


source $HOME/.bash_profile

conda activate Areeba

cd /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4

fastqc --fastqc Animal*.fastq.gz -o /share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/QC_Animal

conda deactivate
