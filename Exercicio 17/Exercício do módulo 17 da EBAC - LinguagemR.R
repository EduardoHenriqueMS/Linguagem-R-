#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Você está preparando uma apresentação executiva, em
# que a visualização dos seus gráficos e aparências farão
# total diferença para transmitir a mensagem para as
# pessoas que assistirão você. Nos gráficos contidos no
# script exercicio.R, coloque rótulos, legendas, cores e
# nomes dos eixos verificando a melhor forma de
# visualização dos mesmos.
# OBS: as cores da empresa pra qual você vai apresentar
# são verde e preto.



##### Passo 1: Carregue as bibliotecas necessárias:
library(dplyr) 
library(tidyverse)  
library(magrittr)
library(readr)
library(lubridate)



##### Passo 2: Carregue a base de dados "covid_2020.csv":
covid_data <- read.csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-14_supportmaterial (covid_2020).csv", sep = ",", dec = ",", stringsAsFactors = FALSE)

glimpse(covid_data)



##### Passo 3: Converta a coluna de data para o formato de data:
covid_data$data <- as.Date(covid_data$data)

class(covid_data$data)



##### Passo 4: Extraia o mês da data:
covid_data$month <- month(covid_data$data)



##### Passo 5: Agrupe os dados por mês utilizando as funções group_by e summarize:

covid_data$populacaoTCU2019 <- as.integer(covid_data$populacaoTCU2019)
covid_data$casosAcumulado <- as.integer(covid_data$casosAcumulado)

dados_por_mes <- covid_data %>%
  group_by(month) %>%
  summarize(
  	populacaoTCU2019 = sum(populacaoTCU2019, na.rm = TRUE),
  	casosAcumulado = sum(casosAcumulado, na.rm = TRUE),
  	casosNovos = sum(casosNovos, na.rm = TRUE),
  	obitosAcumulado = sum(obitosAcumulado, na.rm = TRUE),
  	obitosNovos = sum(obitosNovos, na.rm = TRUE),
  	Recuperadosnovos = sum(Recuperadosnovos, na.rm = TRUE),
  	emAcompanhamentoNovos = sum(emAcompanhamentoNovos, na.rm = TRUE),
  	interior.metropolitana = sum(interior.metropolitana, na.rm = TRUE)
  )



#_________________________________________________________________________________________________________________________________________________
# Declarando o mes NA no Data Frame sendo igual ao mes 1, pois o único mes faltante é o mes 1:
dados_por_mes[12,1] <- 1

# Reordenando as linhas do Data Frame, movendo a última linha como sendo a primeira linha do Data Frame já que se trata do mes 1:
dados_por_mes <- dados_por_mes[c(nrow(dados_por_mes), 1:(nrow(dados_por_mes) - 1)), ]

grafico_dados <- data.frame(mes = c(1:12),
														valores = c(dados_por_mes$populacaoTCU2019,
																				dados_por_mes$casosAcumulado,
																				dados_por_mes$casosNovos,
																				dados_por_mes$obitosAcumulado,
																				dados_por_mes$obitosNovos,
																			  dados_por_mes$Recuperadosnovos,
																			  dados_por_mes$emAcompanhamentoNovos,
																			  dados_por_mes$interior.metropolitana),
														categoria = rep(c("populacaoTCU2019", "casosAcumulado", "casosNovos", "obitosAcumulado", 
																							"obitosNovos", "Recuperadosnovos", "emAcompanhamentoNovos", "interior.metropolitana"), each = 12))



##### Passo 6: Crie gráfico de linhas com cores, rotulos e legendas, utilizando as funções geom_line, labs,theme_minimal e scale_color_manual do ggplot:
grafico_dados %>% 
	ggplot() +
	aes(x = mes,
			y = valores,
			color = categoria) +
	geom_line() +
	scale_x_continuous(breaks = 1:12) +
	scale_color_manual(values = c("populacaoTCU2019" = "blue", "casosAcumulado" = "red", "casosNovos" = "green", 
																"obitosAcumulado" = "purple", "obitosNovos" = "gray", "Recuperadosnovos" = "black", 
																"emAcompanhamentoNovos" = "yellow", "interior.metropolitana" = "orange")) +
	labs(x = "Meses",
			 y = "Valores",
			 title = "Valores dos dados por mes") +
	theme_minimal()



##### Passo 7: Agrupe os dados por estado com as funções filter, group_by e summarize:
media_por_estado <- covid_data %>% 
										group_by(estado) %>%
										filter(!is.na(estado), !is.na(populacaoTCU2019)) %>%
										summarize(
											media_de_casos_estado = mean(populacaoTCU2019, na.rm = TRUE),
										) %>%  view()

media_por_estado <- media_por_estado[-c(1,2),]

media_por_estado %>%  view()



##### Passo 8: Crie gráfico de barras com cores rotulos e legendas, utilizando as funções geom_bar, labs, theme, cord_flip e scale_fill_manual do ggplot:
degrade_cores <- colorRampPalette(c("green", "black"))

media_por_estado <- media_por_estado %>% 
	mutate(
		estado = fct_reorder(estado, desc(media_de_casos_estado))
	)

media_por_estado %>%
	ggplot() +
	aes(x = estado,
			y = media_de_casos_estado,
			fill = estado) +
	geom_col(show.legend = FALSE) +
	labs(x = "Media dos dados",
			 y = "Estados",
			 title = "Media dos dados por Estado") +
	scale_fill_manual(values = degrade_cores(27)) +
	coord_flip() 








