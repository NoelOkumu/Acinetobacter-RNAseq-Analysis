# Qualimap for Mapping Statistics

```
 qualimap bamqc -outdir ${RESULTS_DIR}/qualimap -bam ${RESULTS_DIR}/bam/SRR25305574_sorted.bam
```
If you want basic BAM quality metrics, gff is optional otherwise the qualimap command would look like this:

```
 qualimap bamqc -outdir bamqc -bam SRR25305574_sorted.bam -gff
```

Qualimap computes:

 1. Mapping rate
 2. Coverage across reference
 3. Insert size distribution
 4. GC bias
 5. Read Length Distribution
 6. Coverage Uniformity
 7. Mean Coverage Depth

