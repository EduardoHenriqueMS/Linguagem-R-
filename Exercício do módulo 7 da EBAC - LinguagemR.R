#####################################
############# EXERCICIO #############
#####################################

######### execute este comando para obter os dados
dados_estados <- read.csv2(file.choose(),sep = ",", dec = ",")


######### verifique a estrutura, dimensão e resumo dos dados
str(dados_estados)

summary(dados_estados)


######### filtre os dados somente dos Estados que você deseja calcular a 
######### média de casos (você pode atribuí-los a um novo objeto se quiser)

unique(dados_estados$estado)

amazonas <- dados_estados[dados_estados$estado == "AM",]

tocantins <- dados_estados[dados_estados$estado == "TO",]

roraima <- dados_estados[dados_estados$estado == "RR",]

######### Calcule a média dos casos por mês e por estado (você pode calcular
######### separadamente a média dos 3 estados)

tres_estados_juntos <- dados_estados[dados_estados$estado == "AM" | dados_estados$estado == "TO" | dados_estados$estado == "RR", ]

# Media de casos Amazonas(AM)
mean(amazonas$casos)

# Media de casos Tocantins(TO)
mean(tocantins$casos)

# Medias de casos RORAIMA(RR)
mean(roraima$casos)

# Media dos tres estados no mes de janeiro
estados_mes <- tres_estados_juntos[tres_estados_juntos$mes == "Jan", ]

media_mes <- mean(estados_mes$casos)
# O.B.S: Para saber a media dos outros meses dos 3 estados juntos, 
# basta substituir onde está escrito "Jan" por outro mes presente na colunas "mes"






