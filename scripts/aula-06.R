# Data 19/10/2026
# Programado por Alan Rodrigo Panosso

# Simular duas populações normais
# média zero e variância 1
pop1 <- rnorm(10000)
pop2 <- rnorm(30000)

mean(pop1); mean(pop2)
var(pop1); var(pop2)

hist(pop1, col = "red")
hist(pop2, col = "blue")

# Amostragem
n1 = 30
n2 = 25

v_media <- 0
v_var <- 0
v_razao <- 0

for(i in 1:5000){
  amostra1 <- sample(pop1,n1,replace = TRUE)
  amostra2 <- sample(pop2,n2,replace = TRUE)
  v_media[i] <- (mean(amostra1) - mean(amostra2))/
    sqrt(1/n1+1/n2)
  v_var[i] <- var(amostra1)/var(pop1)*(n1-1)
  v_razao[i] <-var(amostra1)/var(amostra2)
}

# A diferença entre médias tem distribuição
# normal
hist(v_media, prob=TRUE)
curve(dt(x,n1+n2-2),col="red",
      add=TRUE)

# variâncias tem distribuição Qui-quadrado
hist(v_var, prob=TRUE)
curve(dchisq(x,n1-1),col="red",
      add=TRUE)

# A razão entre variâncias tem distrbuição
# F(n1-1, n2-1)
hist(v_razao,probability = TRUE,
     ylim = c(0,1.2))
curve(df(x,n1-1,n2-1),col="red",add=TRUE)

## Carregando Pacotes (Bibliotecas)
## Carregando conjuntos de dados
## Manipular conjunto de dados
library(tidyverse)
library(readxl)

## Entrada de um conjunto de dados
transecto <- read_xlsx("data-raw/transectos.xlsx")

# resumo do meu banco de dados
glimpse(transecto)

# Programação estrutura em R
# PIPE LINE

# Problema: Gerar um vetor de idades
# calcular a média da idade
# arrendodar a média da idade

idades <- c(46, 22, 32, 39, 26, 33, 24, 25)

# aninhamento de funções
round(mean(idades))

# PIPE LINE
idades |>
  mean() |>
  round()

## Voltando ao problemas dos nomes das colunas
## clean_names do pacote janitor, arruma para os padrões
## internacionais os nomes das colunas de qualquer
## conjunto de dados
library(janitor)
transecto <- read_xlsx("data-raw/transectos.xlsx") |>
  clean_names()
glimpse(transecto)

# Resumir com amostra, transecto e argila_percent
transecto |>
  select(amostra, transecto, argila_percent)

# Excluir coordenadas e a variavel silte_percent
transecto |>
  select(-coord_x, -coor_y, -silte_percent)

# Quantos transectos temos, e quais são?
transecto |>
  distinct(transecto)

# Filtrar o banco de dados
# apenas as amostras do transecto "I"
transecto |>
  filter(transecto == "I")

# Filtrar apenas transecto I e as colunas
# amostra, transecto e argila_percent
transecto |>
  filter(transecto == "I") |>
  select(amostra, transecto, argila_percent)

# Qual a média e variância do Teor de Argila ?
transecto |>
  summarise(
    media_argila = mean(argila_percent),
    var_argila = var(argila_percent)
  )

# Qual a média e a variância do Teor de Argila
# por Transecto?
transecto |>
  group_by(transecto) |>
  summarise(
    media_argila = mean(argila_percent),
    var_argila = var(argila_percent)
  )

### Bloxplot da argila por transecto
transecto |>
  ggplot(aes(transecto, argila_percent,
             fill = transecto)) +
  geom_boxplot()

## Criar a estatística descritiva do teor de argila
## para os transectos I e IV
## Verificar pelo teste F se essas variâncias são
## iguais e verofocar pelo teste t se as médias
## dos teores de argila são iguais.
transecto |>
  filter(transecto == "I" | transecto == "IV") |> # filtrando linhas
  group_by(transecto) |>
  summarise(
    n = n(),
    media = mean(argila_percent),
    variancia = var(argila_percent),
    desv_pad = sd(argila_percent)
  )

## Gráfico de dispersão entre as coordenadas do transecto
transecto |>
  ggplot(aes(coord_x, coor_y, color = transecto)) +
  geom_point() +
  theme_bw()

# Histograma do teor de argila
transecto |>
  ggplot(aes(x=argila_percent)) +
  geom_histogram(
    fill = "lightgray",
    color = "black"
  ) +
  theme_bw()

## Observar o histograma para apenas transecto I e IV
transecto |>
  filter(transecto == "I" | transecto == "IV") |>
  ggplot(aes(x=argila_percent)) +
  geom_histogram(
    fill = "lightblue",
    color = "black"
  ) +
  theme_bw()

## Diferenciar por cor, os transectos no histograma
transecto |>
  filter(transecto == "I" | transecto == "IV") |>
  ggplot(aes(x=argila_percent, fill = transecto)) +
  geom_histogram(
    color = "black"
  ) +
  theme_bw()

## Diferenciar por cor, os transectos no histograma
transecto |>
  filter(transecto == "I" | transecto == "IV") |>
  ggplot(aes(x=argila_percent, fill = transecto)) +
  geom_histogram(
    color = "black"
  ) +
  facet_wrap(~transecto, ncol=1) +
  theme_bw()

## Fazer o teste F para verificar se as variâncias
## do teor de argila são semelhantes nos transectos
argila_I <- transecto |>
  filter(transecto == "I") |>
  pull(argila_percent)

argila_IV <- transecto |>
  filter(transecto == "IV") |>
  pull(argila_percent)

# Realizando o teste F-Snedecor
var.test(argila_IV,argila_I)

# Rejeitamos H0 ao nível de 5% de significância
# e concluímos que as variâncias do teor de argila
# para os transectos I e IV são diferentes. A variância
# do transecto IV é maior que a variância do transecto
# I (quanto ao teor de argila...) - Heterocedasticidade.

## Fazer para
# I vs II
# I vs III
# I vs V
# II vs III
# II vs IV
# II vs V
# III vs IV
# III vs V
# IV vs V












