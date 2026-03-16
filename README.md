# Acinetobacter-RNAseq-Analysis

_Acinetobacter baumannii_ is an important nosocomial pathogen that threatens healthcare systems worldwide. Recent evidence suggests that this gram-negative bacterium can enter a viable but non-culturable (VBNC) state, allowing it to persist under prolonged stress conditions. This adaptability makes it an important target for studying bacterial persistence and understanding its transcriptomic responses under stress.

This repository demonstrates a bioinformatics beginner-level analysis workflow using FASTQ RNA-seq data from A. baumannii, including read quality control, genome alignment, variant calling, and visualization.
  
   ![_Acinetobacter baumanii_](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/figures/a_baumanii.jpg)
   
   _Source_:  [Hsuliyang](https://miphidic.com/2014/10/05/acinetobacter-baumannii-image/)

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

# RNA-seq Analysis of Acinetobacter baumannii

## Learning Modules

1. [Conda Environment Setup](01_conda_setup/README.md)
2. [Interpreting FASTQ Files](02_fastq_interpretation/README.md)
3. [Interpreting FastQC Reports](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/tree/main/analysis_modules/03_fastqc_reports#readme)
4. [Data Acquisition Methods](04_data_acquisition/README.md)
5. [Reference Genome Acquisition](05_reference_genome/README.md)
6. [Alignment with BWA-MEM](06_alignment/README.md)
7. [SAMtools Operations](07_samtools/README.md)
8. [Qualimap Analysis](08_qualimap/README.md)
9. [Variant Calling with FreeBayes](09_variant_calling/README.md)

## 📁 Directory structure

To ensure a streamlined input/output redirection throughout the analysis, the following directory structure could serve as a guide before beginning the analysis.

```text
a_baumanii/
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
    └── igv_variant_view.png ```



