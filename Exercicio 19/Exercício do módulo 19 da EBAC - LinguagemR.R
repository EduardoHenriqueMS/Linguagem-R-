# Instale pacotes se ainda não estiverem instalados:
install.packages("tidyverse")
install.packages("readr")



# Carregue bibliotecas necessárias:
library(tidyverse)
library(magrittr)



# Crie uma função para criar um tema personalizado:
tema_personalizado <- function(){
	theme(panel.background = element_blank(),
				panel.grid = element_blank(),
				axis.title.x = element_blank(),
				axis.title.y = element_blank(),
				axis.text.x = element_blank(),
				axis.ticks.x = element_blank(),
				axis.ticks.y = element_blank())
}



# Crie uma função para aplicar um gráfico de barras usando ggplot com um tema personalizado:
aplicar_grafico_barras <- function(dados, coordenadax, coordenaday){
	ggplot(dados, aes(x = {{coordenadax}}, y = {{coordenaday}})) +
		geom_col(fill = "darkblue", color = "black") +
		geom_label(aes(x = {{coordenadax}}, y = {{coordenaday}}, label = {{coordenaday}}), color = "black", fill = "yellow") +
		labs(title = "Nomes e Notas dos 10 melhores Alunos") +
		coord_flip()
}



# Crie uma função para ler dados de um arquivo CSV:
ler_dados_csv <- function(coordenadax){
	read.csv(coordenadax, sep = ",", dec = ".")
}



# Indique o caminho para o arquivo CSV das Notas dos Alunos:
caminho_arquivo_csv <- "../Tarefas EBAC - Rstudio/LinguagemR_modulo-15_supportmaterial (Notas_dos_Alunos).csv"  



# Leia os dados do arquivo CSV:
dados_csv <- ler_dados_csv(caminho_arquivo_csv)



# Exiba as primeiras linhas dos dados:
head(dados_csv)



# Aplique a função de gráfico de barras nos dados:
grafico_final <- dados_csv %>% 
	top_n(10) %>% 
	aplicar_grafico_barras(dados = ., nome_aluno, nota_aluno) + 
	tema_personalizado()



# Imprima o gráfico final:
print(grafico_final)
