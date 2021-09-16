library(tidyverse)
#Usando la función sample
dado_honesto=sample(1:6, size = 100, replace = TRUE)

#Variable discreta, tabla de frecuencia absoluta
table(dado_honesto)

dado <-
  data.frame(A = 1:100, dado_A = dado_honesto)

dado %>% count(a=dado$dado_A)

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

#Tabla mpg2
mpg %>% select (starts_with("c")) %>% filter(class == "pickup") -> mpg2
mpg2

#Tabla census
library(haven)
census <- read_dta("data/census.dta")

##¿Cuáles son las poblaciones totales de las regiones censales?
census %>% group_by(region) %>% summarise( poblacion=sum(pop) ) -> censoT
censoT

##Representa esas poblaciones totales en un diagrama de barras (una barra por región censal)
library(viridisLite)
ggplot(censoT, aes(region, poblacion)) +
  geom_col(fill=viridis(4))

##Ordena los estados por población, de mayor a menor.
census %>% arrange(desc(pop))

##Crea una nueva variable que contenga la tasa de divorcios /matrimonios para cada estado.
census %>% summarise( state, rateDivMa=divorce/marriage ) %>% arrange(rateDivMa)

##Edad mediana y proporcion 18
census %>%
  summarise(Estado=state ,Prop18=pop18p/pop, EdadMediana=medage) %>%
  arrange(EdadMediana) %>% head(10)

##Histograma y curva de densidad
ggplot(data=census)+geom_histogram(mapping = aes(x=medage,y=stat(density)),bins=10,fill="red")+
geom_density(mapping = aes(medage))

