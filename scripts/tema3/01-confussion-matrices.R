# #d Video: Cómo generar matrices de confusión 
cp <- read.csv("../data/tema3/college-perf.csv")

# #d Le damos un orden los factores de forma que los niveles de orden sean Low, el primero y High el úlitmo
# #d lo que hacemos es indicarle al dataframe es que Low está por debajo de Medium y éste de High
# #d Perf: performance
# #d Perd: predecido
cp$Perf <- ordered(cp$Perf, 
                   levels = c("Low", "Medium", "High"))
cp$Pred <- ordered(cp$Pred,
                   levels = c("Low", "Medium", "High"))

# #d creamos una matriz de confusión tabla de doble entrada basada en los valores
# #d actuales y los predichos por el modelo de datos
# #d estas tablas de doble entrada saca los datos cruzados en filas y columnas que tienen los mismos campos
# #d ejemplo
# #d | Actual | Low  | Medium | High |
# #d | Low    | 1150 |   84   |  98  |
# #d | Medium |  166 | 1801   | 170  |
# #d | High   |  35  |   38   | 458  |
# #d Que es la matriz de confusión, donde predice qué tipo de nota sacará un estudiante, en base a su nota anterior
table <- table(cp$Perf, cp$Pred, 
               dnn = c("Actual", "Predecido"))
table
# #d aplicado a la tabla anterior Obtenemos las probabilidades de cada caso
prop.table(table)

# #d redondear la prop.table indicando que las filas sumen el 100 (table, 1) *100 | el 1 es para multiplicar las filas
# #d que, al ser un porcentaje, se ve muy claramente qué probabilidad hay de que un estudiante saque 
# #d determinada nota
round(prop.table(table, 1)*100, 2)
# #d con el 2, usamos las columnas para calcular
round(prop.table(table, 2)*100, 2)

# #d obtener los datos en una tabla
barplot(table, legend = TRUE, 
        xlab = "Nota predecida por el modelo")
# #d mosaico de cajas que pinta con rectánculas las tablas anteriores.
mosaicplot(table, main = "Eficiencia del modelo")
# #d sumary aplicada sobre la tabla
# #d nos aporta información intersante
# #d nos devuelve variables como:
# #d Number of cases in table
# #d Number of factors
# #d Independencia de todos los factores (chisq, df y p-value (El p-valor bajo indica independencia entre el valor actual y el predicho, es decir, que el modelo es eficiente ))
summary(table)
