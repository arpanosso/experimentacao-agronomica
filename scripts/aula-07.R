# Data 16/11/2026
# Programado Por Alan Rodrigo Panosso
# Delineamento Inteiramente Casualizados

# Carregando Pacotes
library(tidyverse)
library(readxl)
library(janitor)

# Ler o conjunto de dados
data_set_racoes <- read_xlsx("data/dados-dic.xlsx",
                             sheet = "racoes") |>
  clean_names()

# Visualização
## resumo do Banco de dados
glimpse(data_set_racoes)

# Visualização com o {skimr}
library(skimr)
skim(data_set_racoes)

# Estatísticas Descritivas
# N
# Média
# Variancia
# Desv Pad
# Mediana
# Max
# Min
# CV
data_set_racoes |>
  summarise(
    media = mean(a_peso, na.rm=TRUE),
    n = n(),
    variancia = var(a_peso, na.rm=TRUE),
    desv_pad = sd(a_peso, na.rm=TRUE),
    med = median(a_peso, na.rm=TRUE),
    menor = min(a_peso, na.rm=TRUE),
    maior = max(a_peso, na.rm=TRUE),
    cv = 100*desv_pad/media,
    epm = desv_pad/sqrt(n)
  ) |>
  t() # transposição da saída (tabela)


# Estatísticas Descritivas por TRAT
data_set_racoes |>
  group_by(racoes) |>
  summarise(
    media = mean(a_peso, na.rm=TRUE),
    n = n(),
    variancia = var(a_peso, na.rm=TRUE),
    desv_pad = sd(a_peso, na.rm=TRUE),
    med = median(a_peso, na.rm=TRUE),
    menor = min(a_peso, na.rm=TRUE),
    maior = max(a_peso, na.rm=TRUE),
    cv = 100*desv_pad/media,
    epm = desv_pad/sqrt(n)
  )

# Visualização do Histograma
data_set_racoes |>
  ggplot(aes(x=a_peso)) +
  geom_histogram(
    color="black",
    fill="lightgrey",
    bins = 7 # controla o número de retângulos
  ) +
  theme_bw()

# Boxplot
data_set_racoes |>
  ggplot(aes(x=racoes, y=a_peso, fill=racoes))+
  geom_boxplot() +
  geom_jitter(color = "red")+
  coord_cartesian(ylim=c(0,50)) +
  theme_bw()

# Criar o Modelo da ANOVA
## isolar y e trat
{
  y <- data_set_racoes$a_peso
  trat <- as_factor(data_set_racoes$racoes)

  ## Criando o modelo da ANOVA
  mod_racoes <- aov(y ~ trat)
  }

## Visualizar o quadro da ANOVA
anova(mod_racoes)

# Diagnósticos (testes da Pressuposições)
## Normalidade dos erros
### isolar os erros - studentizados
rs <- rstudent(mod_racoes)

## Criar o hitograma dos resíduos
hist(rs)

## testes de Normalidade
### Ho: Dados seguem a Distribuição Normal
### H1: Dados não seguem a Distribuição Normal
shapiro.test(rs)
# p-value > 0.05 [0.01], não rejeitamos Ho e
# concluímos que os resíduos seguem a
# distribuição normal.
boxplot(rs ~trat)

# Resíduos vs Preditos (outliers)
yp <- predict(mod_racoes)
plot(yp, rs,"p", ylim=c(-5,5))
abline(h=c(-3.5, 3.5), col="red")

## Demais teste de Normalidade
library(nortest)
lillie.test(rs)
ad.test(rs)
cvm.test(rs)

## Homocedasticidade (homegeneidade de variâncias)
library(lawstat)
# testes de normalidade
## H0: As variâncias são Homogêneas (homocedasticidade)
## H1: As variâncias Não são homogêneas (heterocedasticidade)
levene.test(y, trat, location = "mean")
## Se p-value < 0.05 - rejeitamos h0
# Concluímos ao nível de 5% de significância
# que as variâncias são iguais (homocedásticas)
levene.test(y, trat, location = "median")

# Conduzir a ANOVA com teste de Tukey
























