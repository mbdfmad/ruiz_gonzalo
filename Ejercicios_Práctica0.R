library(tidyverse)
#Usando la función sample
dado_honesto=sample(1:6, size = 100, replace = TRUE)

#Variable discreta, tabla de frecuencia absoluta
table(dado_honesto)

dado <-
  data.frame(A = 1:100, dado_A = dado_honesto)

dado %>% count(dado$dado_A)

#Tabla de frecuencia relativa
signif(prop.table(table(dado$dado_A)), 2)

dado %>%
  count(dado_A) %>%
  mutate(dado_A, relFreq = prop.table(n), n=NULL)

#Dado cargado
pesos=c(1/7, 1/7, 1/7, 1/7, 1/7, 2/7)
dado_honesto=sample(1:6, size = 100, replace = TRUE, prob=pesos)

#Uso de rep y seq
v1=rep(4:1,each=4)
v2=rep(1:5,times=seq(1,5))
v3=rep(1:4,4)
help("select")
#Tabla mpg2
library(gapminder)
gapminder %>% select (starts_with(c))

