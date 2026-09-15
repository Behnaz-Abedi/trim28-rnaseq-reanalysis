library(data.table)

# Read fold change results
result <- read.csv("results/simple_fold_change.csv")

# Read GTF
gtf <- fread(
  "reference/gencode.vM10.annotation.gtf",
  sep = "\t",
  header = FALSE,
  comment.char = "#"
)

# Keep gene features only
gtf_gene <- gtf[gtf$V3 == "gene", ]

# Extract gene_id and gene_name
gene_id <- sub('.*gene_id "([^"]+)".*', "\\1", gtf_gene$V9)
gene_name <- sub('.*gene_name "([^"]+)".*', "\\1", gtf_gene$V9)

annotation <- data.frame(
  gene = gene_id,
  gene_symbol = gene_name
)

# Remove version numbers (.5 etc.)
result$gene_clean <- sub("\\..*", "", result$gene)

annotation$gene_clean <- sub("\\..*", "", annotation$gene)

# Merge
result_annotated <- merge(
  result,
  annotation[, c("gene_clean", "gene_symbol")],
  by = "gene_clean",
  all.x = TRUE
)

# Remove helper column
result_annotated$gene_clean <- NULL

# Reorder columns
result_annotated <- result_annotated[, c(
  "gene",
  "gene_symbol",
  "normal_count",
  "tumor_count",
  "log2FoldChange"
)]

write.csv(
  result_annotated,
  "results/simple_fold_change_annotated.csv",
  row.names = FALSE
)

head(result_annotated)
