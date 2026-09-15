library(DESeq2)

count_matrix <- as.matrix(
  read.csv("results/count_matrix.csv", row.names = 1)
)

# Remove genes with zero counts
count_matrix <- count_matrix[rowSums(count_matrix) > 0, ]

col_data <- data.frame(
  group = c("normal", "tumor"),
  row.names = colnames(count_matrix)
)

dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData = col_data,
  design = ~ group
)

# Normalize counts only
dds <- estimateSizeFactors(dds)

normalized_counts <- counts(dds, normalized = TRUE)

# Calculate tumor vs normal fold change
fold_change <- log2(
  (normalized_counts[, "tumor"] + 1) /
  (normalized_counts[, "normal"] + 1)
)

result <- data.frame(
  gene = rownames(normalized_counts),
  normal_count = normalized_counts[, "normal"],
  tumor_count = normalized_counts[, "tumor"],
  log2FoldChange = fold_change
)

result <- result[order(result$log2FoldChange, decreasing = TRUE), ]

write.csv(
  result,
  "results/simple_fold_change.csv",
  row.names = FALSE
)

head(result)
