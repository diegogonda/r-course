# #d 

students <- read.csv("../data/tema1/data-conversion.csv")

# #d queremos etiquetar a las personas en torno a sus ingresos como bajos, medios y altos
# #d creamos un vector de breakpoints (puntos de separacion, método cut) con estos datos. 
# #d Inf: infinito
bp <- c(-Inf, 10000, 31000, Inf)
names <- c("Low", "Average", "High")

# #d Income.cat: cat es de categorica. Al ejecutarlo, añadiríamos una nueva columna con los nombres Low, Average, y high dependiendo de los ingresos
students$Income.cat <- cut(students$Income, breaks = bp, labels = names)
# #d A diferencia de la anterior, esta funcionalidad no asigna nombres "bonitos" 
# #d sino que asigna el rango numérico, por ejemplo: (-Inf, 1e+04]
students$Income.cat2 <- cut(students$Income, breaks = bp)
# #d cuando no nos importa tanto el rango de los cortes sino que queremos que nos haga N cortes (4 en el ejemplo)
# #d de forma que los N cortes sean equitativos
students$Income.cat3 <- cut(students$Income, 
                            breaks = 4, # #d numero de cortes que queremos
                            # #d quitando labels veriamos por dónde a cortado R
                            labels = c("Level 1", "Level 2", 
                                       "Level 3", "Level 4")
                            )


#dummy variables
# #d variables ficticias
students <- read.csv("../data/tema1/data-conversion.csv")
install.packages("dummies")
library(dummies)

# #d vamos a trabajar con regresion lineal o 
# #d reproducimos variables categorícas como numéricas
students.dummy <- dummy.data.frame(students, sep = ".")
names(students.dummy)

# #d dummy de sólo una de las variables
dummy(students$State, sep=".")

# #d crear variables dummy para las especificadas: names
dummy.data.frame(students, names = c("State", "Gender"), sep = ".")
