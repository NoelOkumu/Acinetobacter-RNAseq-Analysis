# 🗺️ Qualimap for Mapping Statistics

In our case, we only need basic BAM quality metrics

```
 qualimap bamqc -outdir ${RESULTS_DIR}/qualimap -bam ${RESULTS_DIR}/bam/SRR25305574_sorted.bam
```

In a case where gene-level/feature-level statistics are required as part of the mapping report, a genomic feature file would be required.

```
 qualimap bamqc -outdir bamqc -bam SRR25305574_sorted.bam -gff
```
Before running Qualimap, check:

```
 samtools idxstats SRR25305574_sorted.bam | head
```

Then, check the first column of your .gff file:

```
 cut -f 1 GCF_000015425.1_ASM1542V1_genomic.gff | sort | unique| head
```

If they do not match, Qualimap will run, but the results will be misleading

---



Qualimap computes:

 1. Mapping rate
 2. Coverage across reference
 3. Insert size distribution
 4. GC bias
 5. Read Length Distribution
 6. Coverage Uniformity
 7. Mean Coverage Depth
