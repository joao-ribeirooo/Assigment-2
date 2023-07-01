# Instalação dos pacotes necessários
install.packages("vcfR")
install.packages("BiocManager")  
BiocManager::install("pcaMethods")
install.packages("LEA") 

# Carregamento dos pacotes
library(vcfR)
library(pcaMethods)
library(LEA)

# Leitura do arquivo VCF
vcf_file <- "C:/Users/Joao Carlos/OneDrive/Ambiente de Trabalho/teste.vcf"
vcf_data <- read.vcfR(vcf_file)

# Leitura do arquivo de população
caminho_arquivo <- "C:/Users/Joao Carlos/OneDrive/Ambiente de Trabalho/output21.txt"
populacao <- read.csv(caminho_arquivo, header = FALSE, sep = ",")

# Extração do genótipo do arquivo VCF
vcf <- vcf_data@gt
df_vcf <- as.data.frame(vcf)

# Transposição do data frame
df_transposed <- t(df_vcf)

# Combinação dos data frames
df_combined <- cbind(df_transposed, populacao[, 2])

# Leitura do arquivo de genótipo
geno <- LEA::read.geno("C:/Users/Joao Carlos/OneDrive/Ambiente de Trabalho/teste.geno")

# Conversão do genótipo para data frame
df_geno <- as.data.frame(geno)

# Análise de PCA usando o pacote pcaMethods
genoPCAmethods <- pca(df_geno, scale = "vector", center = TRUE)

# Número de colunas do data frame combinado
num_colunas <- ncol(df_combined)

# Plot do PCA
slplot(genoPCAmethods,
       scol = df_combined[, num_colunas],
       scoresLoadings = c(TRUE, FALSE),
       sl = NULL,
       spch = "x")

# Legenda do plot
legend("bottomleft",
       legend = unique(df_combined[, num_colunas]),
       col = unique(df_combined[, num_colunas]),
       pch = "x",
       cex = 0.8)
