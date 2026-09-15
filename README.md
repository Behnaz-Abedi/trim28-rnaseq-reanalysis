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
05_deseq2.R   - normalized fold-change analysis (formal DESeq2 test
                not possible with n=1 per group; see Notes)

## Samples used
- GSM8183427 (prostate, Trim28-light morph, healthy) -> SRR28532213
- GSM8183430 (prostate, Trim28-light morph, tumor)    -> SRR28532216
- Subsampled to 2M read pairs each for alignment (hardware memory limits)

## Notes / limitations
- Only 1 biological replicate per group; DESeq2's formal statistical
  test requires replicates and was not usable here, so a simple
  normalized fold-change was computed instead.
- The paper's light-morph signature genes (Hmga2, Jak3, Mycn, Gnas)
  did NOT show the expected direction of change in this single-animal
  comparison - most likely due to individual variability with n=1,
  limited sequencing depth (2M read subsample), and imperfect read
  pairing during alignment (see tumor.bam.summary).
- This project's purpose was to demonstrate a complete raw-reads-to-
  results RNA-seq pipeline in R under version control, not to draw
  robust biological conclusions.
