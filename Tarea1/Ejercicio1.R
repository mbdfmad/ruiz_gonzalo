library(tidyverse)

chlstrl <- read_csv("./data/cholesterol.csv")

str(chlstrl)

anyN(chlstrl)

sum(is.na(chlstrl))

which(is.na(chlstrl)==TRUE)

mean(chlstrl$chol, na.rm = TRUE)

min(chlstrl$chol, na.rm = TRUE)

max(chlstrl$chol, na.rm = TRUE)

median(chlstrl$chol, na.rm = TRUE)

sd(chlstrl$chol, na.rm = TRUE)

cortes = seq(min(chlstrl$chol,na.rm = TRUE), max(chlstrl$chol,na.rm = TRUE), length.out = 12)
ggplot(data = chlstrl) +
  geom_histogram(mapping = aes(chol), breaks = cortes,
                 fill = "coral2", color="black")

ggplot(chlstrl, aes(x = chol)) +
  geom_histogram(aes(x = chol,y=stat(density)),
                 breaks = cortes, fill = "coral2", color="black")  +
  geom_density(mapping = aes(chol),color="red", size=1.5)

ggplot(chlstrl) +
  geom_boxplot(mapping = aes(y = chol), fill="coral2")

bxp_cty = boxplot(na.omit(chlstrl$chol), col="coral2")

ggplot(chlstrl) +
  geom_violin(mapping = aes(x=0, y = chol)) + scale_x_discrete(breaks = c()) +
  geom_boxplot(mapping = aes(y = chol), fill="coral2") +
  geom_jitter(aes(x=0, y = chol),position = position_jitter(w=0.05, h= 0), col="darkslategrey")



chlstrl$gender=factor(chlstrl$gender)

class(chlstrl$gender)

table(chlstrl$gender)

prop.table(table(chlstrl$gender))

ggplot(chlstrl) +
  geom_bar(mapping = aes(x = gender), fill= c("coral","grey"))


chlstrl %>% mutate(height=height*0.0254,weight=weight*0.454) -> chlstrlSI

chlstrlSI %>%
  mutate("BMI" = weight/(height)^2) -> chlstrlSI


cut(chlstrlSI$age, breaks = seq(10,100,30))

chlstrlSI %>% mutate(ageGroup=cut(chlstrlSI$age, breaks = seq(10,100,30))) -> chlstrlSI

chlstrlSI %>% group_by(ageGroup) %>% count()

chlstrlSI %>% group_by(ageGroup) %>% filter(gender=="female")  %>%
  summarise(MediaChol=mean(chol,na.rm = TRUE),MediaBMI=mean(BMI,na.rm = TRUE))






