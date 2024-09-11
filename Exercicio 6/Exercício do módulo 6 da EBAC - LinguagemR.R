#####################################
############# EXERCICIO #############
#####################################



######### execute este comando para obter os dados da covid-19
dados_covid_19 <- read.csv2(file.choose(),sep = ",", dec = ",")



######### verifique a estrutura, dimensão e resumo dos dados
str(dados_covid_19) #estruta, dimensão e resumo dos dados
# Temos 3 colunas: "estado", "data", "municipio
# Temos nesse Data Frame 250902 linhas 

unique(dados_covid_19$estado)
# Nesse Data Frame temos dois estados "PA" e "SP"

head(dados_covid_19$estado)
# Visão geral das primeiras 6 linhas do Data Frame



######### filtre os dados somente do Estado do Pará (você pode atribuí-los a 
######### um novo objeto se quiser)
Para <- str(dados_covid_19[dados_covid_19$estado == "PA",])
Linhas_Para <- nrow(dados_covid_19[dados_covid_19$estado == "PA",])
# O estado do "PA" ocupa apenas 45792 linhas no Data Frame

Sao_Paulo <- str(dados_covid_19[dados_covid_19$estado == "SP",])
Linhas_Sao_Paulo <- nrow(dados_covid_19[dados_covid_19$estado == "SP",])
# Enquanto o estado de "SP" ocupa 205110 linhas no Data Frame



######### conte quantas observações existem no estado do Pará (pode usar o 
######### comando length())

nrow(dados_covid_19[dados_covid_19$estado == "PA",])
# No estado do Pará existem 45792 observações(linhas)







