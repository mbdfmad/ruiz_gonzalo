
library(tidyverse)
# EJERCICIO I


## APARTADO I


#Creamos un vector llamado valor y otro llamado probabilidad

valor = c(0,1,2,3)

prob = c(64/125, 48/125, 12/125, 1/125)

#La media se calcula con el producto escalar:

media = sum(valor * prob)
media


#La varianza teórica se puede calcular de la siguiente forma:

sum((valor-media1)^2*prob)

## APARTADO 2

valor = c(0,1,2,3)

prob = c(64/125, 48/125, 12/125, 1/125)

k = 100000
n1 = 10
mediasMuestrales1 = replicate (k, {
  muestra = sample(valor, n1, replace = TRUE,prob = prob)
  mean(muestra)
})

ggplot() +
  geom_histogram(aes(x = mediasMuestrales1), bins = 15, fill="coral2", color="black") +
  geom_vline(xintercept = mean(mediasMuestrales1),
             col="black", linetype="dashed", size=1)

mean(mediasMuestrales1)

k = 100000
n1 = 30
mediasMuestrales1 = replicate (k, {
  muestra = sample(valor, n1, replace = TRUE,prob = prob)
  mean(muestra)
})

ggplot() +
  geom_histogram(aes(x = mediasMuestrales1,y=stat(density)), bins = 15, fill="coral2", color="black") +
  geom_vline(xintercept = mean(mediasMuestrales1),
             col="black", linetype="dashed", size=1) +
geom_density(mapping = aes(mediasMuestrales1),color="black", size=1,adjust=2)


bxp_cty = boxplot(na.omit(mediasMuestrales1), mediasMuestrales2, col="coral2")


set.seed(2019)
N = 158000
poblacion = sample(valor,N , replace = TRUE,prob = prob)
n = 20
k = 10000
# replicate repite k veces los comandos entre llaves y guarda el resultado
# del último comando en el vector mediasMuestrales
mediasMuestrales = replicate(k, {
  muestra = sample(poblacion, n, replace = TRUE)
  mean(muestra)
})

hist(mediasMuestrales, breaks = 40, main="",
     col="peachpuff", probability = TRUE, xlim=range(poblacion))
lines(density(mediasMuestrales), lwd=4, col="red")
lines(density(poblacion), lwd=4, col="black")
abline(v = mean(poblacion), lty=2, lwd=5, col="blue")

## APARTADO 3
valor1 = c(0,1,2,3)

prob1 = c(64/125, 48/125, 12/125, 1/125)

valor2 = c(0,1,2)

prob2 = c(1/2,1/4,1/4)

a=prob2 %*% t(prob1)

b=outer(valor2,valor1, FUN = "+")

data.frame(c(a),c(b)) -> data

data %>% group_by(dado=c.b.) %>% summarize(prob=sum(c.a.))-> probabilidades

sum(probabilidades$dado*probabilidades$prob)

weighted.mean(probabilidades$dado,probabilidades$prob )

# APARTADO 4

sum(valor1*prob1)+sum(valor2*prob2)

mean(sample(b,100000,prob=a,replace = TRUE))

k = 100000
X1 = sample(valor1, k, prob = prob1, replace = TRUE)
X2 = sample(valor2, k, prob = prob2, replace = TRUE)
suma = X1+X2

#Ejercicio 2

library(readr)
datos <- read_csv("data/testResults.csv")
datosLimpios <- datos %>%
  separate(gender_age, into = c("gender", "age"), sep = "_", convert = TRUE) %>%
  pivot_longer(c("week1", "week2", "week3", "week4", "week5"), names_to = "week_number",
               values_to = "value")
datosLimpios$gender=factor( datosLimpios$gender, levels = c("m","f"),labels = c("Male","Female") )
datosLimpios$week_number=factor(datosLimpios$week_number,levels = paste("week", 1:7, sep = ""),labels =
                                  paste("week", 1:7, sep = "") )

#Ejercicio 3
#Apartado 1
diamonds
help(diamonds)
ggplot(data = diamonds, mapping = aes(x = carat, y = price)) +
  geom_point()

ggplot(diamonds)+
geom_boxplot(mapping = aes(x = color, y = price))

ggplot(diamonds)+
  geom_boxplot(mapping = aes(x = color, y = price))+
  coord_cartesian(ylim = c(0, 9000))

ggplot(diamonds)+
  geom_boxplot(mapping = aes(x = clarity, y = price))+
  coord_cartesian(ylim = c(0, 9000))

#Apartado 2
population
who

left_join(who,population, by=c("country"="country","year"="year"))

help(who)

who %>%
  pivot_longer(starts_with("new"), names_to = "TBcases",values_drop_na = TRUE) %>%
separate(TBcases, into = c("A", "MethodDiagnosis","GenderAux"), sep = c("_"), convert = TRUE) %>%
  separate(GenderAux,into = c("Gender", "AgeGroup"), sep = 1, convert = TRUE) %>%
select(-A) -> whoLimpio

whoLimpio$Gender=factor( whoLimpio$Gender, levels = c("m","f"),labels = c("Male","Female") )
whoLimpio$AgeGroup=factor( whoLimpio$AgeGroup, levels = c(14,1524,2534,3544,4554,5564,65),
                           labels = c("0-14","15-24","25-34","35-44","45-54","55-64","65") )

whoLimpio<-left_join(whoLimpio,population, by=c("country"="country","year"="year"))


na.omit(whoLimpio)  %>% group_by(country,year,Gender) %>% summarise(CasosTotales=sum(value)) %>%
  filter(year>1995)  %>%  filter(CasosTotales>50000) %>%
 # filter(substr(country,1,2) == "Ba") %>%
ggplot(aes(x = year, y = CasosTotales)) +
  geom_line(aes(colour=country,linetype=Gender,  group=interaction(Gender, country)))

na.omit(whoLimpio)  %>% group_by(country,year,Gender) %>%
  summarise(CasosTotales=sum(value),CasosPor100kHabi=sum(value)*100000/(population)) %>%
  filter(year>1995)   %>%
  filter(substr(country,1,1) == "B") %>%
  ggplot(aes(x = year, y = CasosPor100kHabi)) +
  geom_line(aes(colour=country,linetype=Gender,  group=interaction(Gender, country)))
