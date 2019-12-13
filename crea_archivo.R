# Trabajo final Analisis Demografico III. Proyecciones de poblacion
# entidad Chih.
# 4 de diciembre 2019

##### para contruir el rdata #########

rm(list=ls())                   ### remover variables 
gc()

library(dplyr)

### leer los datos de mortalidad
mx <- read.csv("mortalidad.csv", header = TRUE, check.names = TRUE)
View(mx)
names(mx)
colnames(mx)[3:48] <- c(1970:2015) 


### leer los datos de fecundidad
fx5 <- read.csv("fecundidad.csv", header = TRUE, check.names = TRUE)
View(fx5)
names(fx5)
colnames(fx5)[1] <- "Edad"
colnames(fx5)[2:47] <- c(1970:2015)


#### Px sera la poblacion a inicio de anio chih
Px <- read.csv("pob_inicio.csv", header = TRUE)
names(Px)
colnames(Px)[1] <- "Sexo"
colnames(Px)[2] <- "Edad"
colnames(Px)[3:49] <- c(1970:2016)


#### Nx sera la poblacion a mitad anio chih
Nx <- read.csv("pob_mitad.csv", header = TRUE)
names(Nx)
colnames(Nx)[3:48] <- c(1970:2015)

### salvar en un archivo tipo RData
save.image("C:/Users/rarcos/OneDrive - El Colegio de México A.C/3_semestre/1_Analisis_demografico/final/chih_adem/chih.RData")


















