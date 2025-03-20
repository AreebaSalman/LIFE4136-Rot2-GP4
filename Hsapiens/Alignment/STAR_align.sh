#!/bin/bash

#SBATCH --partition=defq
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=6
#SBATCH --mem=60g 
#SBATCH --time=48:00:00
#SBATCH --job-name=star_alignment
#SBATCH --output=/share/BioinfMSc/rotation2/Group4/alignment/logs/slurm-%x-%j.out
#SBATCH --error=/share/BioinfMSc/rotation2/Group4/alignment/logs/slurm-%x-%j.err
#SBATCH --mail-type=ALL
#SBATCH --mail-user=pcytm7@exmail.nottingham.ac.uk

source $HOME/.bash_profile

conda activate STAR

GENOME_DIR="/share/BioinfMSc/rotation2/Group4/reference"
READS_DIR="/share/BioinfMSc/rotation2/Group4/all_reads"   
OUTPUT_DIR="/share/BioinfMSc/rotation2/Group4/alignment"

for sample in ${READS_DIR}/*_1.fastq.gz
do 
   BASENAME=$(basename "$sample" _1.fastq.gz) #remove the suffix _1.fastq.gz
   
   FORWARD_READ="${READS_DIR}/${BASENAME}_1.fastq.gz"
   REVERSE_READ="${READS_DIR}/${BASENAME}_2.fastq.gz"
#Running the alignment 

STAR --runThreadN 6 \
         --genomeDir "$GENOME_DIR" \
         --readFilesIn "$FORWARD_READ" "$REVERSE_READ" \
         --readFilesCommand zcat \
         --outFileNamePrefix "${OUTPUT_DIR}/${BASENAME}_" \
         --outSAMtype BAM SortedByCoordinate \
         --quantMode GeneCounts

# Rename ReadsPerGene.out.tab to avoid overwriting
mv "${OUTPUT_DIR}/${BASENAME}_ReadsPerGene.out.tab" "${OUTPUT_DIR}/${BASENAME}_GeneCounts.tab" #re name the file to include the sample name more clearly 
done
conda deactivate    
