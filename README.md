# Trim28 RNA-seq reanalysis

Small end-to-end reanalysis of RNA-seq data from Panzeri et al. 2025
(Nature Cancer), GEO accession GSE263021 (RNA-seq SubSeries of GSE262713) -
from raw FASTQ files to normalized expression analysis, entirely in R.

## Pipeline (run in order)
00_setup.R                  - install packages
01_download.R               - download raw FASTQ from ENA
02_qc.R                     - quality control and adapter trimming (Rfastp)
03_align.R                  - build genome index and align reads (Rsubread)
04_count.R                  - count reads per gene (featureCounts)
05_fold_change_analysis.R   - normalized fold-change analysis (DESeq2 statistical testing not applicable with n=1 per group; see Notes)
06_add_gene_symbols.R       - annotate Ensembl gene IDs with gene symbols

## Samples used
- GSM8183427 (prostate, Trim28-light morph, healthy) -> SRR28532213
- GSM8183430 (prostate, Trim28-light morph, tumor) -> SRR28532216
- Subsampled to 2M read pairs each for alignment (hardware memory limits)

## Notes / limitations
- Only 1 biological replicate per group; therefore formal DESeq2 statistical
  testing was not performed. A normalized fold-change comparison was used
  instead.
- The paper's light-morph signature genes (Hmga2, Jak3, Mycn, Gnas)
  did NOT show the expected direction of change in this single-animal
  comparison, likely due to individual variability, limited sequencing depth,
  and the lack of biological replicates.
- This project demonstrates a complete raw-reads-to-results RNA-seq workflow
  in R under version control, rather than drawing robust biological conclusions.
