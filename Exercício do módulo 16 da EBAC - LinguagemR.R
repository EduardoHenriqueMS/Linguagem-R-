#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Os órgãos de saúde desejam verificar visualmente a 
# evolução dos casos novos de Covid no decorrer do ano
# de 2020, agrupados por dia. Além disso, desejam saber 
# o número de casos novos(de todo ano de 2020) por estado.
# Faça um gráfico de linhas para a evolução dos casos novos
# em 2020, agrupados por dia; e um gráfico de barras para a
# visão de casos por estado.

install.packages("readr")
install.packages("tidyverse")
install.packages("magrittr")
install.packages("skimr")
library(readr)
library(tidyverse)
library(magrittr)
library(skimr)
library(lubridate)

base <- read_csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-14_supportmaterial (covid_2020).csv")

colnames(base)

base %>% skim() %>% view()

media_casos_dia <- round(mean(base$casosNovos, na.rm = T),0)

# Faça um gráfico de linhas para a evolução dos casos novos em 2020, agrupados por dia.
base %>%
	filter(!is.na(casosNovos), casosNovos >= 0, !is.na(data)) %>%
	group_by(casosNovos) %>% 
	ggplot() +
	aes(x = data,
			y = casosNovos) +
	geom_line() +
	labs(x = "Dias ao Longo de 2020",
			 y = "Casos Novos",
			 title = "Casos Novos de covid-19 ao longo de 2020")



# E um gráfico de barras para a visão de casos por estado
base %>%
	group_by(estado, casosNovos) %>% 
	filter(!is.na(estado), !is.na(casosNovos), casosNovos >=0) %>% 
	summarise(
		qtd_por_estado <- sum(casosNovos)
	) %>%
	ggplot() +
	aes(x = estado,
			y = casosNovos) +
	geom_col() +
	labs(x = "Estados do Brasil",
			 y = "Quantidade de Novos Casos",
			 title = "Quantidade de Novos Casos no Estado do Brasil")
	