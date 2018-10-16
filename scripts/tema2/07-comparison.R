data <- read.csv("../data/tema2/daily-bike-rentals.csv")

# #d pasamos a variables categóricas
data$season <- factor(data$season, levels = c(1,2,3,4), 
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))
data$workingday <- factor(data$workingday, levels = c(0,1),
                          labels = c("Festivo", "De trabajo"))
data$weathersit <- factor(data$weathersit, levels = c(1,2,3),
                          labels = c("Despejado", "Nublado", "Lluvia/Nieve ligera"))
# #d usamos el formato de fecha que sea más correcto
data$dteday <- as.Date(data$dteday, format = "%Y-%m-%d")
# #d como ya sabemos, pasamos las variables internas de data a variables de R
attach(data)

# #d generamos un diagrama de dos filas y dos columnas
par(mfrow=c(2,2))
# #d obtenemos los datos de conteo (cnt) de cada estación
winter <- subset(data, season == "Invierno")$cnt
spring <- subset(data, season == "Primavera")$cnt
summer <- subset(data, season == "Verano")$cnt
fall   <- subset(data, season == "Otoño")$cnt

# #d sacamos el histograma de cada estación con una linea vertical con la media (rojo) y la mediana (azul)
hist(winter, prob = TRUE, xlab = "Alquiler diario en invierno", main ="")
lines(density(winter))
abline(v = mean(winter), col = "red")
abline(v=median(winter), col = "blue")


hist(spring, prob = TRUE, xlab = "Alquiler diario en primavera", main = "")
lines(density(spring))
abline(v = mean(spring), col="red")
abline(v=median(spring), col="blue")


hist(summer, prob = TRUE, xlab = "Alquiler diario en verano", main = "")
lines(density(summer))
abline(v = mean(summer), col="red")
abline(v=median(summer), col="blue")


hist(fall, prob = TRUE, xlab = "Alquiler diario en otoño", main = "")
lines(density(fall))
abline(v = mean(fall), col="red")
abline(v=median(fall), col="blue")

# #d diagramas de judias
install.packages("beanplot")
library(beanplot)

par(mfrow=c(1,1))
# #d Azul: histograma de frecuencias, la función de densidad
# #d Rojo: las frecuencias, es un rallado que, a mayor frecuencia, mayot ocurrencia
# #d Amarillo: Igual que las rojas, pero que se salen de la funcion de densidad.
beanplot(data$cnt ~ data$season, col = c("blue", "red", "yellow"))


#causalidad
# #d Explicar algún fenómeno
# #d Se usan cuando sospechamos que algo puede pasar, y queremos corroborarlo
# #d es decir, nos sirve para confirmar hipótesis
# #d en par.setting indicamos que cada rectangulo tenga un color => rojo: despejado, amarillo: nublado y verde: lluvia/Nieve ligera
# #d panel: añadir información adicional, por ejemplo la dispersión de los datos
library(lattice)
bwplot(cnt ~ weathersit, data = data, 
       layout = c(1,1), 
       xlab = "Pronóstico del tiempo",
       ylab = "Frecuencias",
       panel = function(x,y,...){
         panel.bwplot(x,y,...)
         panel.stripplot(x,y,jitter.data = TRUE,...)
       },
       par.settings = list(box.rectangle = list(fill = c('red', 'yellow', 'green'))))

