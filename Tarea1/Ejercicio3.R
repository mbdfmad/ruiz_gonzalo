#Capitulo 3
#Gráfico 1
library(gridExtra)

{r}
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point() +
  geom_smooth(se = FALSE) -> g1


#Gráfico 2

{r}
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, group = drv)) +
  geom_point() +
  geom_smooth(se = FALSE,method = 'loess',formula =y ~ x) -> g2


#Gráfico 3

{r}
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_point() +
  geom_smoo(se = FALSE) -> g3


#Gráfico 4

{r}
ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy),se = FALSE) -> g4


#Gráfico 5

{r}
ggplot() +
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy, colour = drv)) +
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy, linetype = drv),se = FALSE) -> g5


#Gráfico 6

{r}
ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(size = 4, color = "white") +
  geom_point(aes(colour = drv)) -> g6

grid.arrange(g1, g2, g3, g4,g5,g6, nrow = 3)
#Capitulo 5
#Ejercicio 1 Sección 5.2.4

library(tidyverse)
library(nycflights13)

flights


#Tengan retraso de llegada de dos o más horas
filter(flights, arr_delay>=120 )

#Volasen a Houston (IAH o HOU)
filter(flights, dest == "IAH" | dest == "HOU")

flights_df = data.frame(flights)

filter(flights, carrier == "UA" | carrier == "AA" | carrier == "DL")

filter(flights, month == 6 | month == 7 | month == 8)

filter(flights, arr_delay<=dep_delay-0.5 , dep_delay>=1)

filter(flights, dep_time>=0 & dep_time<=600)




