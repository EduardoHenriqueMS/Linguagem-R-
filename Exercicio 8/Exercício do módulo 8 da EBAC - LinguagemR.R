#####################################
############# EXERCICIO #############
#####################################

######### Seu gestor deseja saber quantos casos de 
######### covid foram se acumulando, mês a mês, no 
######### estado do Amazonas ("AM"). Faça um laço 
######### que calcule o número de casos acumulados 
######### por mês e informe quantos casos, no geral, 
######### possui o estado do Amazonas.


######### execute este comando para obter os dados da covid-19
dados_estados <- read.csv2(file.choose(),sep = ",", dec = ",")

######### verifique a estrutura, dimensão e resumo dos dados
str(dados_estados)
dim(dados_estados)
summary(dados_estados)
head(dados_estados)

colnames(dados_estados)
unique(dados_estados$estado)

######### filtre os dados somente do Estado do Amazonas ("AM") que você deseja
######### calcular o número de casos acumulados
######### (você pode atribuí-los a um novo objeto se quiser)

dados_estados_amazonas <- dados_estados[dados_estados$estado == "AM",]

######### Faça o laço através de for, if ou while (você pode atribui a uma
######### nova coluna se quiser)

# Laço através de for:
dados_estados_amazonas$contador_casos <- numeric(length(dados_estados_amazonas$mes))

dados_estados_amazonas$contador_casos[1] <- dados_estados_amazonas$casos[1]

somatorio <- dados_estados_amazonas$contador_casos[1]

for (x in 2:length(dados_estados_amazonas$mes)) {
  somatorio <- somatorio + dados_estados_amazonas$casos[x]
  dados_estados_amazonas$contador_casos[x] <- somatorio
}

#________________________________________________________________________________________________________________________

# laço através de while:

dados_estados_amazonas_2 <- dados_estados[dados_estados$estado == "AM",]

dados_estados_amazonas_2$contador_casos <- numeric(length(dados_estados_amazonas_2$mes))

x = 2

dados_estados_amazonas_2$contador_casos[1] <- dados_estados_amazonas_2$casos[1]

somatorio_2 <- dados_estados_amazonas_2$casos[1]

while (x<13) {
  somatorio_2 <- somatorio_2 + dados_estados_amazonas_2$casos[x]
  dados_estados_amazonas_2$contador_casos[x] <- somatorio_2
  x <- x+1
}

# informe quantos casos, no geral,possui o estado do Amazonas:
soma_casos_covid_amazonas <- sum(dados_estados_amazonas$casos)
