# Trim28 RNA-seq reanalysis

Small end-to-end reanalysis of RNA-seq data from Panzeri et al. 2025
(Nature Cancer), GEO accession GSE262713 - from raw FASTQ files to
differential gene expression, entirely in R.

## Pipeline (run in order)
00_setup.R    - install packages
01_download.R - download raw FASTQ from ENA
02_qc.R       - quality control and adapter trimming (Rfastp)
03_align.R    - build genome index and align reads (Rsubread)
04_count.R    - count reads per gene (featureCounts)
05_deseq2.R   - differential expression + PCA (DESeq2)

## Samples used
- GSM8183427 (prostate, Trim28-light morph, healthy) -> SRR28532213 -> normal_1/2.fastq.gz
- GSM8183430 (prostate, Trim28-light morph, tumor)    -> SRR28532216 -> tumor_1/2.fastq.gz
- Subsampled to 2M read pairs each for alignment (due to local hardware memory limits)

## Notes
Demonstration with 2 samples (1 per group); not statistically powered
for robust biological conclusions on its own, but demonstrates the
complete raw-reads-to-results workflow under version control.
