library(curl)

dir.create("data/raw_fastq", recursive = TRUE, showWarnings = FALSE)

download_one <- function(url, destfile) {
  cat("Downloading:", destfile, "\n")
  result <- multi_download(
    urls = url,
    destfiles = destfile,
    resume = TRUE,
    progress = TRUE
  )
  print(result[, c("success", "status_code", "error")])
}

download_one(
  "https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR285/013/SRR28532213/SRR28532213_1.fastq.gz",
  "data/raw_fastq/normal_1.fastq.gz"
)

download_one(
  "https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR285/013/SRR28532213/SRR28532213_2.fastq.gz",
  "data/raw_fastq/normal_2.fastq.gz"
)

download_one(
  "https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR285/016/SRR28532216/SRR28532216_1.fastq.gz",
  "data/raw_fastq/tumor_1.fastq.gz"
)

download_one(
  "https://ftp.sra.ebi.ac.uk/vol1/fastq/SRR285/016/SRR28532216/SRR28532216_2.fastq.gz",
  "data/raw_fastq/tumor_2.fastq.gz"
)
