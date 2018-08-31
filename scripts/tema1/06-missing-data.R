data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")

data.cleaned <- na.omit(data)


is.na(data[4,2])
is.na(data[4,1])
is.na(data$Income)

#Limpiar NA de solamente la variable Income
data.income.cleaned <- data[!is.na(data$Income),]
#Filas completas para un data frame
# #d complete.cases devuelve un array booleano en el que indica qué filas de la tabla están completas de forma que, al escribir data[complete.cases(data)] obtener un dataset limpio de NA
complete.cases(data)
data.cleaned.2 <- data[complete.cases(data), ]
#Convertir los ceros de ingresos en NA
data$Income[data$Income == 0] <- NA

#Medidas de centralización y dispersión
# #d mean es el promedio
# #d na.rm elimina los datos con NA para poder realizar el cálculo
mean(data$Income)
mean(data$Income, na.rm = TRUE)

# #d sd es la desviacion típica
sd(data$Income)
sd(data$Income, na.rm = TRUE)
