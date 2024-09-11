###### Exercicios #####

### rode a linha de código abaixo
# são as informações das vendas da empresa AlgoMais, por sabor de 
# refrigerante estão neste objeto qtd_algomais

qtd_algomais <- data.frame(sabor_refri = c("Uva", "Laranja", "Groselha"),
                           qtd_vendas = c(54,15,30))

### rode a linha de código abaixo

# são as informações das vendas da empresa AlgoMais, por mês 
# de janeiro a julho, no objeto AM_hist

AM_hist <- data.frame(mes = as.Date(c("01/01/2021", "01/02/2021", "01/03/2021", "01/04/2021", "01/05/2021", "01/06/2021", "01/07/2021")),
                      vendas = c(12, 13, 11, 16, 14, 13, 20))


# Comando:

#  Produza um gráfico de barras das vendas da empresa de
# refrigerante AlgoMais, por sabor. 

GraficoBarras <- barplot(height=c(54, 15, 30),
                         names.arg=c("Uva", "Laranja", "Groselha"),
                         main= "Grafico de Barras de ALgoMais",
                         col= "red",
                         border= "black",
                         ylim= c(0,60),
                         xlab= "Sabores de Refrigerante",
                         ylab= "Vendas",
                         legend.text= "Quantidade de Vendas",
                         horiz= FALSE,
                         sub= "O gráfico de barras mostra a quantidade de vendas de cada sabor de refrigerante")



# Além disso, faça um gráfico de linhas 
# das vendas da empresa AlgoMais de
# janeiro a julho (objeto AM_hist)

SerieTemporal <- ts(data= AM_hist$vendas,
                    start= 1,
                    frequency= 1)

GraficoLinhas <- plot(SerieTemporal,
                      type= "b",
                      main= "Grafico de Linhas de AlgoMais",
                      col= "dark blue",
                      xlab= "Mes",
                      ylab= "Vendas por mes",
                      ylim= c(10, 21),
                      xlim= c(0, 7),
                      sub= "O grafico mostra a quantidade de vendas por mes no ano de 2021")





