#########################################
############# PROJETO FINAL #############
#########################################

# Opção 1: Base de Crédito Seu gestor quer saber mais sobre os clientes do banco
# que trabalham e possuem empréstimo, pois haverá uma novo feirão de renegociação!
#	Ele pede que você faça uma análise aprofundada sobre o perfil de crédito destes
# clientes. Com essa análise ele pretende escalar para a diretoria a fim de montar
# uma nova estratégia de abordagem a estes clientes. Produza este relatório com
# análises sólidas e indicando qual melhor caminho o gestor deve tomar a fim de
# obter melhores abordagens aos clientes e sucesso no feirão de renegociação.

library(tidyverse)
library(magrittr)
library(readr)
library(skimr)

base <- read_delim("../Projeto Final/data-raw/LinguagemR (dados_credito).txt")

glimpse(base)


# Mostra a quantidade total de valores NA
sum(is.na(base))


# Exibe esses valores NA, para tomarmos a decisão se eles são relevantes ou não para a resolução do problema
base %>%
  filter(if_any(everything(), is.na)) %>% view()


# Verificando quais colunas tem NA:
anyNA(base$status) #FALSE
anyNA(base$tempo_empresa) #FALSE
anyNA(base$moradia) #TRUE
anyNA(base$tempo_emprestimo) #FALSE
anyNA(base$idade) #FALSE
anyNA(base$estado_civil) #TRUE
anyNA(base$registros) #FALSE
anyNA(base$trabalho) #TRUE
anyNA(base$renda) #TRUE
anyNA(base$ativos) #TRUE
anyNA(base$dividas) #TRUE
anyNA(base$valor_emprestimo) #FALSE
anyNA(base$preco_do_bem) #FALSE

# Colunas que tem NA:
anyNA(base$moradia) #TRUE
anyNA(base$estado_civil) #TRUE
anyNA(base$trabalho) #TRUE
anyNA(base$renda) #TRUE
anyNA(base$ativos) #TRUE
anyNA(base$dividas) #TRUE

# Passando as colunas que estão em "dbl" para "int"
base <- base %>%
  mutate(across(where(is.double), as.integer))


# Arrumando as colunas com valores NA:



# moradia
base <- base %>%
  select(-moradia)
# O.B.S.: Removendo a coluna moradia do data_frame pois não é relevante para a analise



# estado_civil
base <- base %>%
  select(-estado_civil)
# O.B.S.: Removendo a coluna estado_civil do data_frame pois não é relevante para a analise



# trabalho
base$trabalho %>% unique()

base <- base %>%
	mutate(
		trabalho = ifelse(is.na(trabalho), "outros", trabalho)
	)
# O.B.S.: Substituindo os valores NA para "outros"



# renda
base$renda %>% unique()

base <- base %>%
	mutate(
		renda = ifelse(is.na(renda), 0, renda)
	)
# O.B.S.: Passando os valores NA para 0, pois provavelmente a pessoa não deve ter uma renda e colocou como NA



# ativos
base$ativos %>% unique()

base <- base %>%
	mutate(
		ativos = ifelse(is.na(ativos), 0, ativos)
	)
# O.B.S.: Passando os valores NA para 0, pois provavelmente a pessoa não deve ter um ativo e acabou colocando NA.



# dividas
base$dividas %>% unique()

# Conferindo os valores NA na coluna dividas
sum(is.na(base$dividas))

# O.B.S.: Substituindo os valores NA que tem o perfil com "status" com a média de dividas
#					substituindo os valores NA que tem o perfil com "status" bom com o valor 0

media_dividas <- round(mean(base$dividas, na.rm = TRUE),0)

base <- base %>%
	mutate(
		dividas = ifelse(is.na(dividas), ifelse(status == "ruim", media_dividas, 0), dividas)
	)

# Conferindo os valores NA na coluna dividas
sum(is.na(base$dividas))



# Salvando a base tratada
write.csv2(base, "data/base_credito.csv")
