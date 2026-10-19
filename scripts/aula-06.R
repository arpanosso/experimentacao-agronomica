# Data 19/10/2026
# Programado por Alan Rodrigo Panosso


##################################
# Distribuição da Média Amostral #
##################################

# Distribuições amostrais - Teorema do Limite Central
# Expressa muito bem a distribuição da média

## Populaçao com distribuição normal com média
## zero (0) e variância unitária (1).
pop <- rnorm(1200000)
n <- 10

# Média tem distribuição normal com média zero e variância
# 1/sqrt(n)
1/(10)

## Amostragem
vetor_medias <- 0
for(i in 1:10000){
  amostra <- sample(pop,n,replace = TRUE)
  vetor_medias[i] <- mean(amostra)
}
mean(vetor_medias)
var(vetor_medias)

# Histograma da População
hist(pop,
     probability = TRUE,
     xlim = c(-4,4))

# Histograma da Amostra
hist(vetor_medias,
     probability = TRUE,
     xlim = c(-4,4))

########################################
# A dsitribuição da Variância Amostral #
########################################
# Mas como é adistribuição da variância?
# a estatística:
# (n-1)s²/SIGMA² tem distribuição Qui-quadrado
# com n-1 graus de liberdade.

# para a popução anterior
vetor_vars <- 0
for(i in 1:10000){
  amostra <- sample(pop, n, replace = TRUE)
  vetor_vars[i] <- (n-1)*var(amostra)/1
}

#Criar o histograma e a curva teórica



#############################################
# A distribuição da Diferença entre Médias  #
#############################################
# Se as amostras são provenientes de uma população
# sob a hipótese H0 verdadeira a estatística
# (media_X - media_Y)/sqrt(1/n1+1/n2) tem distribuição
# normal com média 0 e variância 1

pop1 <- rnorm(130000) # média zero e variância 1
pop2 <- rnorm(110000) # média 10 e variância 1
mean(pop1); var(pop1)
mean(pop2); var(pop2)

## vamos amostrar e encontrar a diferença entre
## as médias
n1 <- 25
n2 <- 30

vetor_dif_medias <- 0
for(i in 1:10000){
  amostra1 <- sample(pop1,n1,replace = TRUE)
  amostra2 <- sample(pop2,n2,replace = TRUE)
  vetor_dif_medias[i] <- (mean(amostra1) - mean(amostra2))/
    sqrt(1/n1+1/n2)

}
hist(vetor_dif_medias, prob=TRUE)
curve(dnorm(x),add = TRUE, col="red")

##############################################
# Distribuição da Razão entre Variâncias     #
##############################################
vetor_razao_vars <- 0
for(i in 1:10000){
  amostra1 <- sample(pop1,n1,replace = TRUE)
  amostra2 <- sample(pop2,n2,replace = TRUE)
  vetor_razao_vars[i] <- (var(amostra1) / var(amostra2))
}
hist(vetor_razao_vars, prob=TRUE)
curve(df(x,n1-1, n2-1),add = TRUE, col="red")
