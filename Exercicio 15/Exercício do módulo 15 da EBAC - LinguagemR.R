#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Uma professora deseja verificar as notas dos alunos 
# através de um gráfico. Monte uma estrutura de ggplot
# para a base de "Notas_dos_Alunos", tendo os eixos x
# e y como as colunas nome do aluno e notas, respectivamente.
# Ao final da estrutura, adicione o comando geom_col() e execute.

install.packages("magrittr")
install.packages("tidyverse")
install.packages("skimr")
library(magrittr)
library(tidyverse) # No pacote tidyverse já vem contido o "ggplot2", então não precisamos chamar a biblioteca "ggplot2"
library(skimr)

base <- read.csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-15_supportmaterial (Notas_dos_Alunos).csv", sep = ",", dec = ".")

# Analisando a base:
base %>% skim() %>% view()
colnames(base)

unique(base$nome_aluno)

media <- round(mean(base$nota_aluno),2)

# Fazendo o grafico:
base %>% 
	ggplot() +
	aes(x = reorder(nome_aluno, nota_aluno), 
			y = nota_aluno,
			group = media,
			color = media) +
	geom_col() +
	labs(x = "Nome Dos Alunos", y = "Nota Dos Alunos", title = "Nota Da Turma") +
	theme(axis.text.x = element_text(angle = 90, hjust = 0.8))
