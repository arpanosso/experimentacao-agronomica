# Aula 03 - Experimentação Agronômica
# Data - 31/08/2026
# Programado por - Alan Rodrigo Panosso

# Carregando Pacotes necessários
library(readxl)
library(tidyverse)

# Lendo o banco de dados presente na pasta data
# do nosso projeto em EXCEL

# 1 buscar os nomes das planilhas
excel_sheets("data/dados-lista-3.xlsx")

# 2 carrengando os dados de amino ácidos, faturamento e
# fertilidade, em objetos diferentes
amino_acidos <- read_xlsx("data/dados-lista-3.xlsx")
amino_acidos

