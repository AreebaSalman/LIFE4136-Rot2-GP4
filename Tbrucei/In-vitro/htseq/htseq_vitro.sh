#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=23:00:00
#SBATCH --job-name=count_vitro
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq_vitro/logs/%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq_vitro/logs/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbxas26@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate Areeba

# File paths
trim_vitro=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie1_vitro
ref_ann=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference1/TriTrypDB-68_TbruceiTREU927.gff
out_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq_vitro

# Count reads for each
for n in {1..5};
do
   python -m HTSeq.scripts.count -m union $trim_vitro/mapped${n}.sam $ref_ann > $out_dir/counts_vitro${n}.txt
done

# Deactivate conda environment
conda deactivate

