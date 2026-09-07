library(curl)

dir.create("data/raw_fastq", recursive = TRUE, showWarnings = FALSE)

download_one <- function(url, destfile) {
  cat("شروع دانلود:", destfile, "\n")
  result <- multi_download(
    urls = url,
    destfiles = destfile,
    resume = TRUE,
    progress = TRUE
  )
  print(result[, c("success", "status_code", "error")])
}

