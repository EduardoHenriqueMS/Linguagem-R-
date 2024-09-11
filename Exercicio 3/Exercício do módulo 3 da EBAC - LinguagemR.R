######################################
############### EXERCICIO ############
######################################

# 1) O CHEFE DA EQUIPE DE ANALYTICS PEDIU A VOCÊ QUE TIRASSE A MÉDIA DE
# VENDAS DOS ÚLTIMOS 10 ANOS. SABE-SE QUE OS DADOS DOS ÚLTIMOS 10 ANOS
# SÃO: 100, 120, 130, 115, 150, 145, 165, 200, 195, 198. TIRE A MÉDIA:

media_calculada = (100+120+130+115+150+145+165+200+195+198)/10

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# 2) ESTE MESMO CHEFE AGORA QUER ENTENDER QUAL FOI O PERCENTUAL DE
# VARIAÇÃO DE VENDA DO ANO RETRASADO PARA O ANO PASSADO.
# DICA: FACA O CÁCULO VARIAÇÃO UTILIZANDO MULTIPLICAÇÃO E DIVISÃO

100 - (195*100/198)

# A lógica que eu usei para o exercício acima foi:

# -> Passo1:

#           198 - 100%
#           195 - x

# -> Passo2:
#           198*x = 195*100
#           x = 98.48485%

# -> Passo3:
#           100% - 98.48485% = 1.51515%

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# 3) O SEU CHEFE QUER QUE A MÉDIA CALCULADA NA PRIMEIRA QUESTÃO SEJA 
# UM NÚMERO INTEIRO. TRANFORME-O

as.integer(media_calculada)
