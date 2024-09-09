###### Exercicios #####


### rode a linha de código abaixo
# são as informações das vendas da empresa Refresh, por sabor de 
# refrigerante estão neste objeto R

R <- data.frame(Sabor = c("Uva", "Laranja", "Groselha"), 
                Vendas = c(30,20,60))

R


# crie um data frame com os elementos de algo mais (vendas por cada sabor)

# Informações

# AlgoMais vendeu 80% a mais que Refresh em refrigerantes de uva
AumentoPercentual <- R[1,2] + (R[1,2] * 80/100)


# AlgoMais vendeu 5 unidades a menos que Refresh em refrigetante de laranja
MenosUnidades <- R[2,2] - 5

# AlgoMais vendeu a metade dos refrigerantes de groselha vendidos pela Refresh.
MetadeRefrigerantes <- R[3,2] / 2


# Data Frame AlgoMais
AlgoMais <- data.frame(Sabor = c("Uva", "Laranja", "Groselha"),
                       Vendas = c(AumentoPercentual, MenosUnidades, MetadeRefrigerantes))

AlgoMais

