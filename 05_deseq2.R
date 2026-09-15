library(DESeq2)

count_matrix <- as.matrix(read.csv("results/count_matrix.csv", row.names = 1))

col_data <- data.frame(
  group = c("normal", "tumor"),
  row.names = colnames(count_matrix)
)

dds <- DESeqDataSetFromMatrix(
  countData = count_matrix,
  colData = col_data,
  design = ~ group
)

dds <- DESeq(dds)
res <- results(dds)
res_ordered <- res[order(res$padj), ]

write.csv(as.data.frame(res_ordered), "results/deseq2_results.csv")

head(res_ordered)