# Acinetobacter-RNAseq-Analysis

_Acinetobacter baumannii_ is an important nosocomial pathogen that threatens healthcare systems worldwide. Recent evidence suggests that this gram-negative bacterium can enter a viable but non-culturable (VBNC) state, allowing it to persist under prolonged stress conditions. 

This repository demonstrates a bioinformatics analysis workflow using FASTQ RNA-seq data from A. baumannii, including read quality control, genome alignment, variant calling, and visualization.
  
   ![_Acinetobacter baumanii_](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/figures/a_baumanii.jpg)

## Project objectives

The goal of this project is to demonstrate a simple and reproducible workflow for analyzing transcriptomic sequencing data. The analysis focuses on:

1. Assessing the quality of raw sequencing reads

2. Aligning reads to the A. baumannii reference genome

3. Evaluating alignment quality and mapping statistics

4. Performing variant calling for a haploid genome

5. Visualizing alignments and detected variants using genome browsers

## 🔀 Project pipeline

   ![Sequence Analysis_Structure](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/figures/Abaumanii_analysis.png)

## 🗄️ Data Source

- Organism: Acinetobacter baumannii

- Data type: RNA-seq

- Source: NCBI SRA

- Accession number: [SRR25305574](https://www.ncbi.nlm.nih.gov/sra/SRX21049059[accn])

## 📁 Directory structure

To ensure a streamlined input/output redirection throughout the analysis, the following directory structure could serve as a guide before running of the script.

```text
Acinetobacter-RNAseq-Analysis/
│
├── a_baumanii.yml     # Conda environment file
├── pipeline.sh        # Analysis script
│
├── data/              # Raw sequencing data
│   └── (FASTQ files)
│
├── refs/              # Reference genome files
│   └── (fasta, gff, BWA index files) 
│
├── results/           # Output directory
│   ├── fastqc/        # FastQC reports
│   ├── sam/           # SAM alignment files
│   ├── bam/           # BAM files and mapping stats
│   ├── qualimap/      # Qualimap QC reports
│   └── vcf/           # Variant calls (VCF files)
│
└── figures/
    ├── workflow.png
    ├── fastqc_summary.png
    ├── qualimap_summary.png
    └── igv_variant_view.png
