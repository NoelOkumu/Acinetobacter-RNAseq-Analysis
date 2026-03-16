# Conda Setup
Workflow entails:
 ```
Obtaining Reads -> Data Pre-processing -> Alignment -> Mapping Alignment Stats -> Variant Calling
```

Ideally, creating a conda environment helps contextualise your project with the necessary tools required for reproducible analysis. Download the ```a_baumanii.yml``` file that has been provided to aid in creating a conda environment with all the necessary tools required for the analysis from [a_baumanii.yml](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/scripts/a_baumanii.yml) provided in the scripts folder.

To create the environment in your local machine, navigate to your terminal and run:

```
 conda env create -f a_baumanii.yml
 conda activate a_baumanii
```



[← Previous: FASTQ Files](https://github.com/NoelOkumu/Acinetobacter-RNAseq-Analysis/blob/main/analysis_modules/02_fastq_interpretation/README.md) | [Next: Data Acquisition →](https://github.com/NoelOkumu/Acinetobacter-RNAseq-analysis/blob/main/analysis_modules/04_data_acquisition/README.md)



