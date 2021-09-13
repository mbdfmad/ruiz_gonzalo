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


