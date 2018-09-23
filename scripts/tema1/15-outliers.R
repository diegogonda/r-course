# #d cuando encontramos datos que se salen de la línea
# #d son valores extremos que pueden ser problemáticos porque se salen de la línea
# #d pueden introducir desvios en los resultados en las predicciones finales
ozone.data <- read.csv("../data/tema1/ozone.csv", stringsAsFactors = F)

# #d detectamos los valores extremos (outliers)
# #d buscamos que se salen de la presion de la altura
# #d el parámetro boxwex modula la anchura de la caja, muy útil si queremos incorporar varias
# #d obtenemos un diagrama de caja y bigotes: 
# #d https://es.wikipedia.org/wiki/Diagrama_de_caja
# #d $out permite ver en la consola los numéricos de los outliers
boxplot(ozone.data$pressure_height, 
        main = "Pressure Height",
        boxwex = 0.5)$out


summary(ozone.data$pressure_height)

# #d sacamos las presiones según los meses
boxplot(pressure_height ~ Month, 
        data = ozone.data,
        main = "Presure Height per Month"
        )
# #d distribución del ozono por mes
boxplot(ozone_reading ~Month,
        data = ozone.data,
        main = "Ozone reading per Month")$out

# #d con mtext escribimos texto en la gráfica, por ejemplo los outliers
mtext("Hola")

# #d decidir qué tipo de correcciones queremos aplicar al modelo

# #d primer enfoque: intercambio de los outliers por la media o la mediana
# #d reemplazamos los valores que estén por debajo del 5% percentir por la media
# #d los del 95% por la mediana
impute_outliers <- function(x, removeNA = TRUE){
  quantiles <- quantile(x, c(0.05, 0.95), na.rm = removeNA)
  x[x<quantiles[1]] <- mean(x, na.rm = removeNA) # #d si es menor que 0.05 %
  x[x>quantiles[2]] <- median(x, na.rm = removeNA) 
  x
}

imputed_data <- impute_outliers(ozone.data$pressure_height)
# #d con par ordenamos varios gráficos organizandolos en x filas e y columnas ( en el ejemplo 1 fila, 2 columnas)
par(mfrow = c(1,2))
# #d vemos los gráficos con los datos corregidos
boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(imputed_data, main = "Presión sin outliers")


# #d capamos los outliers sustiyéndolos 
replace_outliers <- function(x, removeNA = TRUE){
  qrts <- quantile(x, probs = c(0.25, 0.75), na.rm = removeNA)  # #d cuartiles con probabilidad por debajo de 0.25 y por encima del 0.75
  caps <- quantile(x, probs = c(.05, .95), na.rm = removeNA)
  iqr <- qrts[2]-qrts[1]  # #d rango intercuartílico
  h <- 1.5 * iqr # #d height
  x[x<qrts[1]-h] <- caps[1] 
  x[x>qrts[2]+h] <- caps[2]
  x
}
# #d comprobamos si este reemplazo es mejor o peor que el anterior
capped_pressure_height <- replace_outliers(ozone.data$pressure_height)

par(mfrow = c(1,2))
boxplot(ozone.data$pressure_height, main = "Presión con outliers")
boxplot(capped_pressure_height, main = "Presión sin outliers")


