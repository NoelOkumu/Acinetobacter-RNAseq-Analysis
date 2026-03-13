
#!/bin/bash

##Set working Directory
work_dir="$HOME/Documents/Msc_Bioinformatics/seq_analysis_hpc_comp/data/a_baumanii"
data="${work_dir}/data/raw"
ref="${work_dir}/data/refs"

##Activate conda environmnet
# Optional 
#conda env create -f a_baumanii.yml
#conda activate a_baumanii

#change directory to the working directory a.baumanii_align3
cd ${data}

#Obtain data 
#Sequencing reads 
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_2.fastq.gz
wget -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_1.fastq.gz 

#Ref_genome - using ncbi-datasets
datasets download genome accession CP039025.2 \
	--include genome,gff,rna \
	--filename Abaumannii_ATCC17978_ref.zip
unzip -p - "ncbi_dataset/data/*/*.fna" > ${work_dir}/data/refs/Abaumannii_ATCC17978_ref.fasta 


##EDA -Exploring data
#View first 100 lines in fastq file. 
head -100 ${work_dir}/data/raw/SRR25305574_1.fastq
head -100 ${work_dir}/data/raw/SRR25305574_2.fastq
 
cat ${work_dir}/data/raw/SRR25305574_1.fastq | grep "@SRR25305574" | wc -l
cat ${work_dir}/data/raw/SRR25305574_2.fastq | grep "@SRR25305574" | wc -l

#Preprocessing and Validating Reads
for fq in ${work_dir}/data/raw/*.fastq; do
    fastqc "$fq" -O ${work_dir}/data/processed
done

#Analyse read quality by checking the html output
xdg-open ${work_dir}/data/processed/*.fastq

### Alignment 
#Index
bwa-mem2 index -p ${ref}/abaumanii ${ref}/Abaumanii.fasta 

#Align
bwa-mem2 mem -t 2 ${ref}/abaumanii SRR25305574.fastq > ${work_dir}/data/processed/SRR25305574.sam
mv SRR25305574_mappingstats.txt ${work_dir}/data/processed/

#convert sam to bam file using samtools
samtools view -b -T ${ref}/Abaumanii.fasta  ${work_dir}/data/processed/SRR25305574.sam > ${work_dir}/data/processed/SRR25305574.bam

#sort bam file
samtools sort ${work_dir}/data/processed/SRR25305574.bam -o ${work_dir}/data/processed/SRR25305574_sorted.bam

#index file using samtools
samtools index ${work_dir}/data/processed/SRR25305574_sorted.bam 

#view mapstats file
head -100 ${work_dir}/data/processed/SRR25305574_mappingstats.txt


#Match obtained .gff to .bam - qualimap needs .bam and .gff to have similar naming conventions for features
#bam header
#samtools idxstats ${work_dir}/data/processed/SRR25305574_sorted.bam | head
#gff header
#cut -f1 ${ref}/GCF_025995075.1_ASM2599507v1_genomic.gff |sort|uniq|head
#alignment summary using qualimap
#qualimap bamqc -outdir bamqc -bam ${work_dir}/data/processed/SRR25305574_sorted.bam -gff annii_ATCC_17978.fasta.gff
#Left out Qualimap with .gff - .bam and .gff feature name mismatch

#Qualimap without .gff
qualimap bamqc -outdir ${work_dir}/data/processed/qualimap -bam ${work_dir}/data/processed/SRR25305574_sorted.bam

#variant calling for haploid using freebayes
freebayes -f ${ref}/Abaumanii.fasta -p 1 ${work_dir}/data/processed/SRR25305574_sorted.bam > ${work_dir}/data/processed/SRR25305574_sorted.vcf

#compress vcf file to bgzp
bgzip -c ${work_dir}/data/processed/SRR25305574_sorted.vcf > ${work_dir}/data/processed/SRR25305574_sorted.vcf.gz 

#create TBI index for vcf file
bcftools index -t ${work_dir}/data/processed/SRR25305574_sorted.vcf.gz

#view ref, bam, vcf in IGV or genome browse
 
