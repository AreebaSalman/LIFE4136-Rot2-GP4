#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --mem=100g
#SBATCH --time=48:00:00
#SBATCH --job-name=reference_index
#SBATCH --output=/share/BioinfMSc/rotation2/Group4/reference/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation2/Group4/reference/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@exmail.nottingham.ac.uk


source $HOME/.bash_profile

conda activate Python

STAR --runThreadN 6 \
--runMode genomeGenerate \
--genomeDir /share/BioinfMSc/rotation2/Group4/reference \
--genomeFastaFiles /share/BioinfMSc/rotation2/Group4/reference/Homo_sapiens.GRCh38.dna_sm.primary_assembly.fa \
--sjdbGTFfile /share/BioinfMSc/rotation2/Group4/reference/Homo_sapiens.GRCh38.113.gtf \
--sjdbOverhang 99

conda deactivate
