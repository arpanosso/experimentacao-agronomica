# Aula 02 - Experimentação Agronômica
# Data - 24/08/2026
# Programado por - Alan Rodrigo Panosso

# Resolver a Lista de Exercícios - 1

# Lista 01 ----------------------------------------------------------------
(.packages()) # lista os pacotes carregados

# carregando um pacote
library(MASS)

# Instalação de Pacotes
# vamos instalar o "agricolae"
# Aba Packages/Install/ Digitar nome do Pacote/Install
library(agricolae)
(.packages())

# TIPOS PRIMÁRIOS
# Numérica - INTEIRO - INT
1
2
66
-500

# Numérica - FLOAT - DOUBLE
1.58
3.14
-0.001

# Lógicos - BOOLEAN
TRUE # 1 é o verdadeiro
FALSE # 0 é o falso

# Caracter - STRING
# toda a informação passada entre áspas o R entenderá
# como um texto
"Alan"
'Maria'
"0.55"

# Objetos - TEXTO
frase <- "Oi Mundo"
frase
Frase
FRASE

# Criar nome idade e juntar os objetos na forma de texto
nome <- "Alan Rodrigo Panosso"
idade <- 45
paste("Meu nome é", nome, "e tenho", idade, "anos de idade")

# Operadores
2+2 # adição
2-2 # subtração
2*2 # multiplicação
2/2 # divisão
1/2
5 %/% 2 # inteiro da divisão
5 %% 2 # resto da divisão
(200 %/% 10) %% 4
5^2+3 # POTÊNCIA, elevado a
5**2+3 # POTÊNCIA, elevado
3+8*2
(3+8)*2
sqrt(25) + # função raiz quadrada
   19 - # somando 19 unidades
   23  # subtraindo 23 unidades
3.0 * 5.0 +1
1/(4+2)
28 / 7 + 4
3/6 - 7
2>3
4 <= 8/2
4 = 8/2 # erro = é atribuição (<-)
4 == 8/2 # == é o operador relaciona de igualdade
5 != 4 # diferente de
idade > 20 # se idade é 45, retorna verdadeiro
nome == "Fulano de Tal"
nome == "Alan Rodrigo Panosso" # operação relacional

# Conjunção - E
TRUE & TRUE
TRUE & FALSE
FALSE & TRUE
FALSE & FALSE

# Disjunção - OU
TRUE | TRUE
TRUE | FALSE
FALSE | TRUE
FALSE | FALSE

# Negação - Não
!TRUE
!FALSE

# Construção de um vetor x , contendo as idades
x <- c(43, 33, 25, 30)
x
sum(x) #  x[1] + x[2] + x[3] + x[4]
max(x)
min(x)
mean(x)

# Resolver para Casa 7 e o 8

# Exercício 7
A <- 3421
B <- A %/% 100
C <- A %% 100
paste("B =",B ,"e C =", C)

# Exercício 8
a <- 872
c <- a%/% 100
d <- a%% 100 %/% 10
u <- a %% 10
soma = c + d + u
paste("A soma é", soma)

# Exercício 9
A <- 30
B <- 9
if(A > B){
  A
} else {
  B
}

# Criar o vetor e notas
notas <- c(6,8,4,5,3,1)
ifelse(notas >= 5,"Aprovado", "Reprovado")
ifelse(notas < 3, "REP",ifelse(notas<5,"REC","APR") )

# Exercício 10
# imprimir os valores de 1 a 20, criar um vetor de 1 a 20
# utilizo os :
1:20
20:1
seq(0,25,5)
minha_sequencia <- seq(10,0,-2)

# Para a casa 12 e o 13
# Exercício 12

positivos <- seq(1,10,2)
negativos <- -1*seq(2,10,2)

S = sum(positivos/(positivos^2) + negativos/(negativos^2))
paste("O valor de S é:",
      round(S,4))

# Exercíco 13

#Gerar idades aleatórias
set.seed(1235) # semente aleatória
idade <- round(runif(30, 3, 97)) # 30 valores entre 3 e 97 anos
ifelse(idade <= 25, "jovem",
       ifelse(idade <= 60, "adulto", "idoso"))


# Lista 02 ----------------------------------------------------------------
x <- c(11, 13, 20, 10, 10, 13, 16, 17, 16, 12)

# função de soma
sum(x)

# mínimo e máximo
min(x)
max(x)
range(x)

# amplitude
max(x) - min(x)
diff(range(x))

# tamanho do vetor, número de posições do vetor
length(x)

# SOMA DOS QUADRADOS
sum(x^2)

# SOMA AO QUADRADO
sum(x)^2

# Média
mean(x)

# Crair os desvios
e <- x - mean(x)
e
sum(e)

# Soma de Quadrados dos Desvios
sum(e^2)

# Soma de Quadrados dos Desvios, sem calcular desvios
sum(x^2) - sum(x)^2/length(x)

















