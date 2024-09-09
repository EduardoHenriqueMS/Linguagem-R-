#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Na base de dados_covid_2020.csv, filtre só o estado 
# de SP e agrupe os dados por mês, e indique o número 
# de casos por mês. Faça um cálculo de proporção e transforme 
# em percentual a representatividade de cada mês em relação ao total.

install.packages("rio")
install.packages("tidyverse")
install.packages("scales")
install.packages("magrittr")
install.packages("readr")
install.packages("lubridate")
library(rio)
library(tidyverse)
library(scales)
library(magrittr)
library(readr)
library(lubridate)

base <- read_csv("../Desktop/Tarefas EBAC - Rstudio/LinguagemR_modulo-14_supportmaterial (covid_2020).csv")

base_SP <- base %>% 
				filter(estado == "SP") %>% 
				group_by(mes = month(data)) %>% 
				summarise(
					casos_mes = sum(casosAcumulado, na.rm = T)
				) %>% mutate(
					proporcao_mes = casos_mes/sum(casos_mes),
					proporcao_mes = percent(proporcao_mes, acurracy = 0.1)
				) %>% arrange(mes) %>% view()
