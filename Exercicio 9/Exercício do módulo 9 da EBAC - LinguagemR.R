#####################################
############# EXERCICIO #############
#####################################

######### Em um núcleo de estudos, você tem dois 
######### projetos para fazer: uma análise para uma 
######### base de crédito, e outra análise para dados 
######### de RH. Importe as duas bases, nos formatos 
######### indicados, e depois verifique a estrutura de 
######### suas variáveis. Indique também, no script, em
######### forma de comentário, se é necessário alguma 
######### modificação nas variáveis.

# Importando as Bases de Dados:
base_credito <- read.delim(file.choose(), sep = ",", dec = ",")
base_rh <- read.csv(file.choose(), sep = ",", dec = ".")

# Verificando a estrutura das Bases de Dados:
head(base_credito)
head(base_rh)

dim(base_credito)
dim(base_rh)

str(base_credito)
str(base_rh)

summary(base_credito)
summary(base_rh)

# Verificando se as bases de dados possuem NA's:
sum(is.na(base_credito))
sum(is.na(base_rh))
# A "base_credito" possui 475 dados NA enquanto que a "base_rh" não possui nenhum dado NA.

######### Indique também, no script, em forma de comentário, se é necessário alguma modificação nas variáveis.
# A única transformação que eu faria nessa Base de Dados seria usar um encodador para passar as variáveis que estão no formato
# de caracter para numérico, para facilitar depois a análise e quem sabe a criação de um modelo de Machine Learning com esses
# dados.