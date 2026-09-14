# Data 14/09/2026
# Programado por Alan Rodrigo Panosso

# Variável número entre 0-9 escolhidos pela turma

# defininfo a variável
x <- c(0,0,1,0,5,4,3,7,6,1)

# posições de x
length(x)

#n amotral
sum(x)

#  distribuição e x
X <- rep(0:9, x)

hist(X, xlim=c(0,10))
mean(X)
var(x)
sd(X)

##  Simples demonstração do Teorema do Limite
## Central
## Dada uma variável que não segue a distribuição
## normal, sua média proveniente de uma amostragem
## aleatória simples com reposição, tem distribuição
## aproximadamente normal com média e variância
## conhecidas (mi e sigama dois dividio por k)
k <- 16
pop <- X
medias <- 0
vars <- 0

for(i in 1:10000){
  amostra <- sample(pop, k, replace = TRUE)
  medias[i] <- mean(amostra)
  vars[i] <- var(amostra)
}
hist(medias, xlim=c(0,10))
mean(medias)
mean(vars)
mean(sqrt(vars))


hist(medias, xlim=c(0,10), probability = TRUE,
     ylim=c(0,1.25))
curve(dnorm(x, 6.14,1.747/sqrt(k)),add=TRUE,
      col="red",lwd=2)
















