# Data 05/10/2026
# Programado por Alan Rodrigo Panosso

altura <- c(1.93, 1.69, 1.90, 1.65, 1.70,
             1.70, 1.61, 1.56, 1.82, 1.55)
mean(altura)
sd(altura)

# Estatística do Teste
(mean(altura) - 1.72)/(sd(altura)/sqrt(10))

# TESTE t-Student
t.test(altura,
       mu = 1.72,
       var.equal = TRUE,
       alternative = "l")

# Critério de Rejeição é o
# p-value
# Rejeitamos H0 se p-valeu <= ao alpha
# p-value foi maior que (5% - 0.05)
# Não rejeitamos H0 e concluímos que
# a média de altura dos alunos é
# igual a 1,72 m.
curve(dt(x,9),-4,5)
qt(0.025,9)
qt(0.975,9)
abline(v=0,col="blue")
abline(v=c(-2.62, 2.62), col="red",
       lty =2)
