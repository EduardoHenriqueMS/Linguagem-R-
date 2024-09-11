################################################
############# TRATAMENTO DOS DADOS #############
################################################

# COMANDO GERAL DA QUESTÃO:
# Uma empresa de da área educacional deseja obter um relatório de notas dos
# candidatos de um determinado concurso. Estruture um projeto, gerando um
# relatório com as informações das notas dos candidatos deste concurso.
# Utilize recursos como gráficos e visuais para enriquecer seu relatório.

library(tidyverse)
library(magrittr)
library(readr)
source("R/grafico_barras_qualquer_disciplina.R")
source("R/tema.R")


base <- read_csv("../LinguagemR_modulo-21_supportmaterial (Notas_concurso).csv")

write.csv2(base, "data-raw/nota_concurso.csv")

glimpse(base)

# Passando a coluna "Nota" para inteiro:
base$Nota <- as.integer(base$Nota)

media_nota <- round(mean(base$Nota),0)



base %>%
	mutate(
		Nome_inscricao = paste0(Nome, sep = " - ", Inscricao, sep = " - ", Disciplina)
	) %>%
	top_n(7, Nota) %>%
	grafico_melhores(dados = ., coordenadax = Nome_inscricao, coordenaday = Nota) +
	tema()



base %>%
	mutate(
		Nome_inscricao = paste0(Nome, sep = " - ", Inscricao, sep = " - ", Disciplina)
	) %>%
	top_n(7, desc(Nota)) %>%
	grafico_piores(dados = ., coordenadax = Nome_inscricao, coordenaday = Nota) +
	tema()



base %>%
	mutate(
		Nome_inscricao = paste0(Nome, sep=" - ", "Inscricao ",Inscricao, sep=" - ", Disciplina)
	) %>%
	filter(
		Disciplina == "matematica"
	) %>%
	top_n(7, Nota) %>%
	ggplot() +
	aes(x = reorder(Nome_inscricao, Nota),
			y = Nota) +
	geom_col(fill = "darkblue") +
	geom_label(aes(x = Nome_inscricao, y = Nota, label = Nota), color = "white", fill = "darkblue") +
	labs(x = "Notas", y = "Alunos Destaque", title = "Alunos Destaque em Matemática") +
	coord_flip() +
	tema()



base %>%
	mutate(
		Nome_inscricao = paste0(Nome, sep=" - ", "Inscricao ",Inscricao, sep=" - ", Disciplina)
	) %>%
	filter(
		Disciplina == "matematica"
	) %>%
	top_n(7, desc(Nota)) %>%
	ggplot() +
	aes(x = reorder(Nome_inscricao, Nota),
			y = Nota) +
	geom_col(fill = "darkblue") +
	geom_label(aes(x = Nome_inscricao, y = Nota, label = Nota), color = "white", fill = "darkblue") +
	labs(x = "Notas", y = "Piores Alunos", title = "Alunos com as piores Notas no Concurso") +
	coord_flip() +
	tema()

