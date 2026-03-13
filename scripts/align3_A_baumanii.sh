
#!/bin/bash

##Set working Directory
SCRIPT_DIR="$( cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

WORK_DIR="$SCRIPT_DIR"
DATA_DIR="${WORKDIR}/data"
REF_DIR="${WORK_DIR}/refs"
RESULTS_DIR="${WORK_DIR}/results"

##Activate conda environment
# Optional 
conda env create -f a_baumanii.yml
conda activate a_baumanii

#Obtain data 
#Sequencing reads 
wget -P ${DATA_DIR} -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_2.fastq.gz
wget -P ${DATA_DIR} -nc ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR253/074/SRR25305574/SRR25305574_1.fastq.gz 

#Ref_genome - using ncbi-datasets
datasets download genome accession CP039025.2 \
	--include genome,gff,rna \
	--filename Abaumannii_ATCC17978_ref.zip
unzip -p - "ncbi_dataset/data/*/*.fna" > ${REF_DIR}/Abaumannii_ATCC17978_ref.fasta 


##EDA -Exploring data
#View first 100 lines in fastq file. 
head -100 ${DATA_DIR}/SRR25305574_1.fastq
head -100 ${DATA_DIR}/SRR25305574_2.fastq
 
cat ${DATA_DIR}/SRR25305574_1.fastq | grep "@SRR25305574" | wc -l
cat ${DATA_DIR}/SRR25305574_2.fastq | grep "@SRR25305574" | wc -l

#Preprocessing and Validating Reads
for fq in ${DATA_DIR}/*.fastq; do
    fastqc "$fq" -O ${RESULTS_DIR}
done

#Analyse read quality by checking the HTML output
xdg-open ${RESULTS_DIR}/*.fastqc.html

### Alignment 
#Index
bwa-mem2 index -p ${REF_DIR}/abaumanii ${REF_DIR}/Abaumanii.fasta 

#Align
bwa-mem2 mem -t 2 ${REF_DIR}/abaumanii SRR25305574.fastq > ${RESULTS_DIR}/sam/SRR25305574.sam

#convert sam to bam file using samtools
samtools view -b -T ${REF_DIR}/Abaumanii.fasta  ${RESULST_DIR}/sam/SRR25305574.sam > ${RESULTS_DIR}/bam/SRR25305574.bam

#sort bam file
samtools sort ${RESULTS_DIR}/bam/SRR25305574.bam -o ${RESULTS_DIR}/bam/SRR25305574_sorted.bam

#index file using samtools
samtools index ${RESULTS_DIR}/bam/SRR25305574_sorted.bam 

#Show mapping statistics
samtools flagstat ${RESULTS_DIR}/bam/SRR25305574_sorted.bam > ${RESULTS_DIR}/bam/SRR25305574_mappingstats.txt

#view mapstats file
head -100 ${RESULTS_DIR}/bam/SRR25305574_mappingstats.txt


#Match obtained .gff to .bam - qualimap needs .bam and .gff to have similar naming conventions for features
#bam header
#samtools idxstats ${work_dir}/data/processed/SRR25305574_sorted.bam | head
#gff header
#cut -f1 ${ref}/GCF_025995075.1_ASM2599507v1_genomic.gff |sort|uniq|head
#alignment summary using qualimap
#qualimap bamqc -outdir bamqc -bam ${work_dir}/data/processed/SRR25305574_sorted.bam -gff annii_ATCC_17978.fasta.gff
#Left out Qualimap with .gff - .bam and .gff feature name mismatch

#Qualimap without .gff
qualimap bamqc -outdir ${RESULTS_DIR}/qualimap -bam ${RESULTS_DIR}/bam/SRR25305574_sorted.bam

#variant calling for haploid using freebayes
freebayes -f ${REF_DIR}/Abaumanii.fasta -p 1 ${RESULTS_DIR}/bam/SRR25305574_sorted.bam > ${RESULTS_DIR}/vcf/SRR25305574_sorted.vcf

#compress vcf file to bgzp
bgzip -c ${RESULTS_DIR}/vcf/SRR25305574_sorted.vcf > ${RESULTS_DIR}/vcf/SRR25305574_sorted.vcf.gz 

#create TBI index for vcf file
bcftools index -t ${RESULTS_DIR}/vcf/SRR25305574_sorted.vcf.gz 

#view ref, bam, vcf in IGV or genome browse
 
