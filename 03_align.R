library(Rsubread)

buildindex(
  basename = "reference/mm10_index",
  reference = "reference/GRCm38.primary_assembly.genome.fa",
  gappedIndex = TRUE,
  indexSplit = TRUE,
  memory = 6000
)
dir.create("data/bam", recursive = TRUE, showWarnings = FALSE)

align(
  index = "reference/mm10_index",
  readfile1 = "data/trimmed_fastq/normal_trimmed.fastq.gz_R1.fastq.gz",
  readfile2 = "data/trimmed_fastq/normal_trimmed.fastq.gz_R2.fastq.gz",
  output_file = "data/bam/normal.bam"
)

align(
  index = "reference/mm10_index",
  readfile1 = "data/trimmed_fastq/tumor_trimmed.fastq.gz_R1.fastq.gz",
  readfile2 = "data/trimmed_fastq/tumor_trimmed.fastq.gz_R2.fastq.gz",
  output_file = "data/bam/tumor.bam"
)