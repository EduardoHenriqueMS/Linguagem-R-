#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Você tem que padronizar um tema para um relatório da sua empresa. 
# Pense que serão muitos gráficos no relatório. Crie um tema chamado 
# "meu_tema()" e ajuste a cor de fundo, as linhas de grade e tamanho 
# das legendas; e aplique em um gráfico de barras dos casos de covid 
# por estado.

install.packages("magrittr")
install.packages("tidyverse")
library(magrittr)
library(tidyverse)

base_covid <- read.csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-14_supportmaterial (covid_2020).csv", sep = ",", dec = ",")

glimpse(base_covid)

base_covid$casosAcumulado <- as.integer(base_covid$casosAcumulado)

tema_meu <- function(){
	theme(
		panel.background = element_blank(),
		panel.grid = element_blank(),
		axis.title.y = element_blank(),
		axis.title.x = element_blank(),
		axis.text.x = element_text(size = 12),
		axis.text.y = element_text(size = 12)
	)
}

base_covid %>%
	filter(!(estado %in% c("0", "24", "") | is.na(estado))) %>%
	group_by(estado) %>%
	summarise(
		soma_casos_estado = sum(casosAcumulado, na.rm = TRUE) 
	) %>%
	top_n(10) %>% 
	ggplot() +
	aes(x = estado,
			y = soma_casos_estado) +
	geom_col(fill = "darkblue", color = "darkred") +
	geom_label(aes(x = estado, y = 20^6, label = soma_casos_estado), fill = "darkgreen", color = "white") +
	coord_flip() +
	labs(title = "Casos Acumulados de Covid-19 por Estado") +
	tema_meu()
