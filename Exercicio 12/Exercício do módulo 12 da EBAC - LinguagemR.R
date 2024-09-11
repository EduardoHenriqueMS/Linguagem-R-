#####################################
############# EXERCICIO #############
#####################################

# Um casal, apaixonado por filmes, deseja dar o
# nome do seu primeiro filho em homenagem a um
# ator. Eles encontraram na internet uma base de
# dados com os registros de filmes classificados
# pelo IMDB e que possui uma variável com o nome
# dos atores. Com isso, eles desejam avaliar três
# opções de nomes dos atores que mais fizeram
# filmes a partir de 1980. Carregue a base de dados
# 'dados_imdb' e indique quais as opções de nomes
# que esse casal teria para seu primeiro filho.

install.packages("tidyverse")
install.packages("readr")
install.packages("magrittr")
library(readr)
library(magrittr)
library(tidyverse)

dados_imdb <- read_csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-12_supportmaterial (imdb).csv")

str(dados_imdb)

colnames(dados_imdb)

count(dados_imdb$ator_1)

dados_imdb_80_mais <- dados_imdb %>%  
												filter(ano >= 1980) %>%
													group_by(ator_1) %>% 
														summarise(quantidade_filmes_ator_1 = n()) %>% 
															arrange(desc(quantidade_filmes_ator_1)) %>%
																top_n(3)
		
														
