# Measuring mRNA levels by RNA-Seq (Trypanosoma brucei & Homo Sapiens)
## Contents
- [Overview](#overview) 
- [Requirements & Installations](#Requirements&Installations)
## Getting Started
- [Install Conda](#Installconda)
- [Clone Github Repository](#CloneGithubRepository)
## Trypanosoma brucei analysis
- [Quality check](#Qualitycheck)
- [Trimming](#Trimming)
- [Mapping](#Mapping)
- [IGV](#IGV)
- [Read Count](#ReadCount)
- [DESeq2](DESeq2)
- [Reference Index](#ReferenceIndex)
## Homo Sapiens Analysis
- [Indexing](#Indexing)
- [Alignment](#Alignment)
- [DESeq2](#DESeq2)
## Acknowledgements
- [Contributors](#Contributors)
- [References](#References)

## Overview
LIFE4136 Rotation 2 Group 4 This repository contains all the scripts used by Group 4 in completion of the LIFE4136 Group Projects Module. All the scripts used for Tbrucei and Hsapiens are present in this repository. This project aims to measure the mRNA levels of Tbrucei and Hsapiens to check the gene expression levels using DESeq2 analysis. RNA-Seq allows for the precise quantification of mRNA abundance, allowing the identification of differentially expressed genes and their role in numerous biological processes. The following code is in order as it was used to measure mRNA levels to check for differentially expressed genes. The source files for Tbrucei were provided to us, while the files for Hsapiens were downloaded from [BioStudies](https://www.ebi.ac.uk/biostudies/arrayexpress/studies/E-MTAB-4681). Trypanosoma brucei is a single-celled protozoan parasite of the blood that is transmitted by biting insect (tsetse) causing Human African trypanosomiasis (HAT) – sleeping sickness. Our group had to analyse samples for differential gene expression for Animals and In-vitro. Next, to understand eukaryotic transcription with splicing, Hsapien samples of adenocarcinoma and hepatocellular carcinoma were used.
The expected outcomes of our analysis were, 
- High-quality aligned RNA-Seq data.
- Gene count tables.
- Identification of differentially expressed genes between conditions for both organisms.
## Requirements & Installations
Several different packages were used to complete this project. A Requirements.txt file can be found in the repository for downloading and installation purposes.
## Getting Started
### Install Conda
To install Conda on Ubuntu, download the Miniconda installer and run the following commands:
<pre> wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh </pre>
Follow the prompts during installation, and restart your terminal when done.
### Clone Github repository
<pre> git clone https://github.com/AreebaSalman/LIFE4136-Rot2-GP4.git
cd LIFE4136-Rot2-GP4 </pre>
## Trypanosoma brucei analysis
In Trypanosoma brucei, two samples were used, Animals and In-vitro. For both the samples, same tools were used for the analysis. Start your analysis by creating a conda environment.
<pre> conda create python=3.10 -n rotation2 </pre>
### Quality Check
Fastqc package was used to check the quality of the Animals and In-vitro samples. It provides a comprehensive suite of analyses to assess the quality of the raw data.
Intsall the fastqc package in the python=3.10 environment created earlier.
<pre> conda activate rotation2
conda install bioconda::fastqc </pre>
Prepare a script using [quast_Animals.sh](#quast_Animals.sh)
<pre> sbatch quast_Animals.sh </pre>
 An html and a zip file will be produced as a result of the script submitted. Copy the files from ADA back to your computer and view the quality check report in a browser. 
### Trimming
Trim-galore was the package used to trim the samples after viewing the quality of these. Trimming was needed to ensure the data excludes those files which were not needed in order to make our data clean
<pre> conda activate rotation2
conda install bioconda::trim-galore </pre>
Use [TG_animal.sh](#TG_animal.sh) to prepare the scripts according to the data provided.
<pre> sbatch TG_animal.sh </pre>
A fastq and a text file will be genrerated. To view these files copy them to your computer and view them. Check the results of the trimmed files and decide whether more trimming is needed or the samples now are clean to e used for analysis.
### Indexing
To use bowtie2 to align the reads to the reference genome, it is important to index the reference using bowtie build. 
<pre> conda activate rotation2
conda install bioconda::bowtie2 </pre>
[indexing_reference.sh](#indexing_reference.sh) is the example script to build an index using bowtie build. 
<pre> sbatch indexing_reference.sh </pre>
bam and bam.bai files will be generated using the above script. These files are important for viewing in IGV for the analysis.
### Mapping
Sequence alignment or mapping is done for the purpose of identifying evolutionary relationships, regions of similarity, functional and structural differences. To align the sequences to the reference genome, bowtie2 was used.
<pre> conda activate rotation2 </pre>
Bowtie2 package was already insatlled in the environment to use for indexing the reference. There is no need to install it again. Just activate the package and proceed with the script.
Provided are example scripts to be used for the analysis [align_animal_trim.sh](#align_animal_trim.sh)
<pre> sbatch align_animal_trim.sh </pre>
gzipped .sam files will be generated as result of these scripts. .sam files are readable but to view them in IGV .bam files are required.
### IGV
Download the IGV desktop version from [here](https://igv.org/doc/desktop/#DownloadPage/). It was used to view the distribution of mapped reads for one or more of the samples across Chromosome 1. To view the mapped files of Animals and In-vitro, gzipped .sam files had to be converted to .bam and .bam.bai files using samtools
<pre> conda activate rotation2
conda install bioconda::samtools </pre>
Find the IGV preparation script [IGV preparation](#IGVpreparation).
<pre> sbatch IGV preparation </pre>
.bam and .bam.bai files will be generated. Copy those files on to your computer and upload them with the reference genome .bam and .bam.bai files in IGV and view the results.
### Read count
htseq was used to count the reads mapped to each gene in the genome for the purpose of identifying differentially expressed genes.
<pre> conda activate rotation2
conda install bioconda::htseq </pre>
[htseq_animals.sh](#htseq_animals.sh) example scripts are provided to view and use them according to your convenience.
<pre> sbatch htseq_animals.sh </pre>
As a result of submitting these scripts, count text files for all the samples will be generated. Bring these files back to your computer for DESeq2 analysis in R.
### DESeq2
To identify differentially expressed genes in the genome, DESeq2 package was used in R. It is a valuable tool to study gene expression patterns and regulation. From the text files generated from htseq, create a Sample Table with the columns (sampleName,fileName, condition) to describe the dataset.
To install DESeq2 package in R,
<pre>if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")

BiocManager::install("DESeq2") </pre>
Use [DESeq2_Tbrucei](#DESeq2_Tbrucei) to prepare the script. All the analysis of DESeq2 was done in R. A list of top 20 significant genes was prepared to be used in GORILLA to identify the biological processes and functional pathways these genes were involved in. 
## Homo Sapiens
For studying differentially expressed genes in Hsapiens, two samples were provided to us, Adenocarcinoma and Hepatocellular carcinoma. In this case, quality check, and trimming were no longer needed because the data provided to us was already cleaned.
### Indexing
Reference genome assembly and its annotation was downloaded from www.ensembl.org. To align the sequence to the reference genome, the reference genome had to be indexed. A package called STAR was used to index the reference genome. 
<pre> conda activate rotation2
conda install bioconda::star </pre>
Create the STAR index using [STAR_refindex.sh](#STAR_refindex.sh)
<pre> sbatch STAR_refindex.sh </pre>
After running STAR for genome indexing, several files such as Genome, SA, SAindex, and annotation-related files are generated in the specified genome directory.
### Alignment
STAR is a splicing aware aligner that was used to align the reads to the reference genome as the sequence data we had was spliced. STAR performed alignment and counted the reads.
<pre> conda activate rotation2</pre>
STAR was already installed in the environment to index the reference genome. You do not need to download the package again. Just activate the rotation2 environment and use reference STAR script [STAR_align.sh](#STAR_align.sh) to prepare your script.
<pre> satch STAR_align.sh </pre>
After running STAR alignment, the following key files were generated:
Aligned.sortedByCoord.out.bam, Sorted BAM file containing aligned reads,ReadsPerGene.out.tab, Gene-level read counts used for differential expression analysis, Log.final.out, Summary of alignment statistics, SJ.out.tab, List of detected splice junctions
These files were used as input for downstream analysis with DESeq2.

### DESeq2
To identify the differentially expressed genes in Hsapiens, DESeq2 analysis was performed in R. As DESeq2 was already downloaded in R for Tbrucei analysis, just load the libraries needed to be used.
Use this script [DESeq2_Hsapiens](#DESeq2_Hsapiens) as a reference to prepare your analysis. A list of top 20 significant genes were prepared for Hsapiens as well to be used in GORILLA to identify the biological processes and functional pathways of these genes.
## Acknowledgements
### Contributors
All the scripts were jointly made by Leah, Thomas and me. Thankyou for your help!!
## References
- FastQC: [https://www.bioinformatics.babraham.ac.uk/projects/fastqc/](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
- Trim Galore: [https://github.com/FelixKrueger/TrimGalore](https://github.com/FelixKrueger/TrimGalore)
- Bowtie2: [http://bowtie-bio.sourceforge.net/bowtie2/index.shtml](http://bowtie-bio.sourceforge.net/bowtie2/index.shtml)
- HTSeq: [https://github.com/htseq/htseq](https://github.com/htseq/htseq)
- STAR: [https://github.com/alexdobin/STAR](https://github.com/alexdobin/STAR)
- DESeq2: [https://bioconductor.org/packages/release/bioc/html/DESeq2.html](https://bioconductor.org/packages/release/bioc/html/DESeq2.html)
- TriTrypDB Genome Database: [https://tritrypdb.org](https://tritrypdb.org)
- Ensembl Genome Browser: [https://www.ensembl.org](https://www.ensembl.org)
- ArrayExpress E-MTAB-4681: [https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-4681/](https://www.ebi.ac.uk/arrayexpress/experiments/E-MTAB-4681/)
- Matthew Berriman et al. ,The Genome of the African Trypanosome Trypanosoma brucei.Science309,416-422(2005).DOI:10.1126/science.1112642
- Gene expression in Trypanosoma brucei: lessons from high-throughput RNA sequencing
Siegel, T. Nicolai et al.
Trends in Parasitology, Volume 27, Issue 10, 434 - 441
