# FastQ Files

Base-calling software in sequencers converts fluorescence signals into actual sequence data with quality scores, which are then stored in .fastq files. You can get more information on fastq files from [here](https://bioinformatics.ccr.cancer.gov/docs/b4b/Module2_RNA_Sequencing/Lesson10/)

```
  Sequencer -> BCL -------------> FASTQ files
```

There are several methods for obtaining fastq files from public repositories, e.g., NCBI's Sequence Read Archive(SRA) or EMBL's European Nucleotide Archive (ENA). For this exercise, the _A.baumanii_ sequence was retrieved from SRA using sra-toolkit;

```
  fasterq-dump SRR25305574
```

Other methods include:

1. Use of fastq-dump from sra-toolkit (has to be accompanied by a prefetch command)

  ```
    prefetch SRR25305574; fastq-dump SRR25305574
  ```

2.  Use of wget using direct link (URLs) to the file in the archive

  ```
    wget -P ${DATA_DIR} -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_2.fastq.gz
    wget -P ${DATA_DIR} -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_1.fastq.gz
  ```

📍 The use of fastq-dump and fasterq-dump downloads the Forward and Reverse Reads in one file but use of wget
