library(Rfastp)

dir.create("data/trimmed_fastq", recursive = TRUE, showWarnings = FALSE)

rfastp(
  read1 = "data/raw_fastq/normal_1.fastq.gz",
  read2 = "data/raw_fastq/normal_2.fastq.gz",
  outputFastq = "data/trimmed_fastq/normal"
)

rfastp(
  read1 = "data/raw_fastq/tumor_1.fastq.gz",
  read2 = "data/raw_fastq/tumor_2.fastq.gz",
  outputFastq = "data/trimmed_fastq/tumor"
)