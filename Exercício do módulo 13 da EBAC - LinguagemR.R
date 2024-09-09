#####################################
############# EXERCICIO #############
#####################################

# COMANDO GERAL DA QUESTÃO:
# Uma empresa de automóveis quer fazer um
# levantamento dos dos carros que sejam da classe e
# transmissão = "Auto", a partir dos anos 2000. Eles
# possuem uma base com algumas informações. FILTRE,
# na base veiculos.csv, somente aqueles que possuem
# nomes começando com "Auto" nas colunas classe e
# transmissão e que são a partir dos anos 2000. Depois
# disso, levante a informação da quantidade de veículos
# por fabricante e forneça uma tabela com as colunas:
# fabricante, ano (de 2000 a 2015, que é o último ano da
# base) contendo a quantidade de veículos por ano do
# fabricante. 

install.packages("tidyverse")
install.packages("magrittr")
library(tidyverse)
library(magrittr)

veiculos <- read_csv("../Tarefas EBAC - Rstudio/LinguagemR_modulo-13_supportmaterial (veiculos).csv")

str(veiculos)

colnames(veiculos)

veiculos$fabricante

### PRIMEIRA PARTE DO PROBLEMA:
### Uma empresa de automóveis quer fazer um
### levantamento dos dos carros que sejam da classe e
### transmissão = "Auto", a partir dos anos 2000. Eles
### possuem uma base com algumas informações. FILTRE,
### na base veiculos.csv, somente aqueles que possuem
### nomes começando com "Auto" nas colunas classe e
### transmissão e que são a partir dos anos 2000.

veiculos_auto <- veiculos %>% 
	filter(str_detect(classe, pattern = "^Auto") & str_detect(transmissao, pattern = "^Auto"), ano >= 2000) %>% arrange(ano)

### SEGUNDA PARTE DO PROBLEMA:
### Depois disso, levante a informação da quantidade de veículos
### por fabricante e forneça uma tabela com as colunas:
### fabricante, ano (de 2000 a 2015, que é o último ano da
### base) contendo a quantidade de veículos por ano do
### fabricante.

qtd_fabricante_ano <- veiculos %>% 
	group_by(fabricante, ano) %>% 
	filter(ano >= 2000) %>% 
	summarise(qtd_fabricada_ano = n()) %>% 
	select(fabricante, ano, qtd_fabricada_ano) %>% 
	arrange(ano)


