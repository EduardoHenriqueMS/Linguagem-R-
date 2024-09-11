#########################################
############# PROJETO FINAL #############
#########################################

library(tidyverse)
library(magrittr)
library(readr)
library(skimr)

# Analisando

base <- read.csv("../Projeto Final/data/base_credito.csv", sep = ";")

glimpse(base)


# Graficos para entender a base:

base %>%
	group_by(status) %>%
	summarise(
		status_somatorio = n()
	) %>%
	ggplot() +
	aes(x = status,
			y = status_somatorio) +
	geom_col(fill = "darkblue") +
	geom_label(aes(x = status, y = status_somatorio, label = status_somatorio), color = "white", fill = "darkblue") +
	labs(x = "Status", y = "Quantidade Status", title = "Quantidade de Pessoas com status BOM e RUIM") +
	theme(
		panel.background = element_blank(),
		axis.ticks.y = element_blank(),
		axis.text.y = element_blank(),
		axis.text.x = element_text(size = 12, color = "black"),
		axis.title.y = element_blank(),
		plot.title = element_text(hjust = 0.5)
	)



# O.B.S.: Precisamos analisar o perfil das pessoas com status "ruim" e conceder algum tipo de benefício de acordo com a sua necessidade
base_ruim <- base %>%
	filter(status == "ruim") %>%
	view()

# Pessoas que tem o status ruim
base_ruim %>%
  mutate(
    categoria_tempo = ifelse(tempo_empresa >= 10, ">= 10 anos", "< 10 anos")
  ) %>%
  count(categoria_tempo) %>%
  ggplot() +
  aes(x = categoria_tempo,
      y = n,
      fill = categoria_tempo) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c(">= 10 anos" = "darkblue", "< 10 anos" = "darkred")) +
  theme(
    panel.background = element_blank(),,
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) +
	labs(x = "Tempo com a Empresa", title = "Quantidade de clientes recentes e antigos com status RUIM") +
	geom_label(aes(x = categoria_tempo, y = n, label = n), color = "black", fill = "white")

# Pessoas que tem o status ruim e registros de dívidas não pagas
base_ruim %>%
	filter(registros == "sim") %>%
  mutate(
    categoria_tempo = ifelse(tempo_empresa >= 10, ">= 10 anos", "< 10 anos")
  ) %>%
  count(categoria_tempo) %>%
  ggplot() +
  aes(x = categoria_tempo,
      y = n,
      fill = categoria_tempo) +
  geom_col(show.legend = FALSE) +
  scale_fill_manual(values = c(">= 10 anos" = "darkblue", "< 10 anos" = "darkred")) +
  theme(
    panel.background = element_blank(),,
    axis.text.y = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.y = element_blank(),
    plot.title = element_text(hjust = 0.5)
  ) +
	labs(x = "Tempo com a Empresa", title = "Quantidade de clientes recentes e antigos com registro") +
	geom_label(aes(x = categoria_tempo, y = n, label = n), color = "black", fill = "white")



# Negociação mais leve:
base_ruim %>%
  filter(registros == "não") %>%
  mutate(
    categoria_tempo = ifelse(tempo_empresa >= 10, ">= 10 anos", "< 10 anos")
  ) %>%  view()


# Negociação mais aprofundada
base_ruim %>%
  filter(registros == "sim") %>%
  mutate(
    categoria_tempo = ifelse(tempo_empresa >= 10, ">= 10 anos", "< 10 anos")
  ) %>%  view()
