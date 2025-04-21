# Measuring mRNA levels by RNA-Seq (Trypanosoma brucei & Homo Sapiens)
## Contents
- [Overview](#overview) 
- [Requirements & Installations](#Requirements&Installations)
## Getting Started
- [Install Conda](#Installconda)
- [Clone Github Repository](#CloneGithubRepository)
## Trypanosoma brucei analysis
### Animals
- [Quality check](#Qualitycheck)
- [Trimming](#Trimming)
- [Mapping](#Mapping)
- [Read Count](#ReadCount)
- [DESeq2](DESeq2)
### In-vitro
- [Quality check](#Qualitycheck)
- [Trimming](#Trimming)
- [Mapping](#Mapping)
- [Read Count](#ReadCount)
- [DESeq2](DESeq2)
### Reference index
## Homo Sapiens Analysis
- [Indexixing](#Indexing)
- [Alignment](#Alignment)
- [DESeq2](#DESeq2)
## Acknowledgements
- [Contributors](#Contributors)
- [References](#References)

## Overview
LIFE4136 Rotation 2 Group 4 This repository contains all the scripts used by Group 4 in completion of the LIFE4136 Group Projects Module. All the scripts used for Tbrucei and Hsapiens are present in this repository. This project aims to measure the mRNA levels of Tbrucei and Hsapiens to check the gene expression levels using DESeq2 analysis. RNA-Seq allows for the precise quantification of mRNA abundance, allowing the identification of differentially expressed genes and their role in numerous biological processes. The following code is in order as it was used to measure mRNA levels to check for differentially expressed genes. The source files for Tbrucei were provided to us, while the files for Hsapiens were downloaded from here. Trypanosoma brucei is a single-celled protozoan parasite of the blood that is transmitted by biting insect (tsetse) causing Human African trypanosomiasis (HAT) – sleeping sickness. Our group had to analyse samples for differential gene expression for Animals and In-vitro. Next, to understand eukaryotic transcription with splicing, Hsapien samples of adenocarcinoma and hepatocellular carcinoma were used. 
## Requirements & Installations
Several different packages were used to complete this project. A Requirements.txt file can be found in the repository for downloading and installation purposes. Different conda environments were used for every tool/package used.
## Getting Started
### Install Conda
To install Conda on Ubuntu, download the Miniconda installer and run the following commands:
<pre> wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh <pre>
Follow the prompts during installation, and restart your terminal when done.
### Clone Github repository
<pre> git clone https://github.com/AreebaSalman/LIFE4136-Rot2-GP4.git
cd LIFE4136-Rot2-GP4 <pre>

