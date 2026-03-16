# Conda Setup

The first recommended step before performing an analysis is to clearly understand the objectives you intend to meet.

This is a short project that requires skills in ReadsQC and read alignment with BWA-MEM.

Afterwards, generate an alignment summary map using Qualimap after viewing a mapstats file from samtools Flagstat.

Variant calling will also be performed for haploid using freeBayes.

Lastly, we will view the reference, .bam, .vcf files in IGV or a genome browser

Workflow entails:

 ```
Obtaining Reads -> Data Pre-processing -> Alignment -> Mapping Alignment Stats -> Variant Calling
```

Ideally, creating a conda environment helps contextualise your project with the necessary tools required for reproducible analysis. 

Download the ```a_baumanii.yml``` file provided to create a conda environment with all the necessary tools required for the analysis from [a_baumanii.yml](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/scripts/a_baumanii.yml) provided in the scripts folder.

It is often good practice to store the required tools within a ```requirements.txt``` file. This not only helps with reproducibility but also with information about the version of the tools to be used. 

For this exercise, our requirements.txt file contains:

```
  #Important Tools
 fastqc=0.12.1=hdfd78af_0
 bwa-mem2=2.2.1=h9a82719_1
 sra-tools=3.2.1=h4304569_1
 samtools=1.9=h10a08f8_12
 qualimap=2.2.2a=1
 freebayes=1.3.2=py27hc088bd4_0
 bcftools=1.9=ha228f0b_4
```
 
To create the environment in your local machine, navigate to your terminal and run:

```
 conda env create -f a_baumanii.yml
 conda activate a_baumanii
```



[← Previous: FASTQ Files](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/analysis_modules/02_fastq_interpretation/README.md) | [Next: Data Acquisition →](https://github.com/NoelOkumu/Acinetobacter-RNAseq-analysis/blob/main/analysis_modules/04_data_acquisition/README.md)



