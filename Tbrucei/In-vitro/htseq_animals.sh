#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=100g
#SBATCH --time=23:00:00
#SBATCH --job-name=count_ind_animals
#SBATCH --output=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq2/animals/%x-%j.out
#SBATCH --error=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq2/animals/%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=mbyle1@nottingham.ac.uk

# Activate conda environment
source $HOME/.bash_profile
conda activate count

# File paths
trim_animals=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/bowtie_animal2
ref_ann=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/reference/TriTrypDB-68_TbruceiTREU927.gff
out_dir=/share/BioinfMSc/Bill_resources/Tbrucei/fastq/Group4/htseq2/animals

# Count reads for each animal
for n in {1..5};
do
   htseq-count $trim_animals/animal${n}_trim.sam -t exon -s no $ref_ann > $out_dir/counts_nonstrand_animal${n}.txt
done

# Deactivate conda environment
conda deactivate

