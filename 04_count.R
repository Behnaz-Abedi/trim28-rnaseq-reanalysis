library(Rsubread)

dir.create("results", recursive = TRUE, showWarnings = FALSE)

fc <- featureCounts(
  files = c("data/bam/normal.bam", "data/bam/tumor.bam"),
  annot.ext = "reference/gencode.vM10.annotation.gtf",
  isGTFAnnotationFile = TRUE,
  isPairedEnd = TRUE,
  nthreads = 1
)

count_matrix <- fc$counts
colnames(count_matrix) <- c("normal", "tumor")

write.csv(count_matrix, "results/count_matrix.csv")

cat("ابعاد ماتریس شمارش:", dim(count_matrix)[1], "ژن x", dim(count_matrix)[2], "نمونه\n")