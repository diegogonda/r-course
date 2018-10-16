# #d realizar gráficos que comparen información
# #d útil para cantidades grandes de datos
data <- read.csv("../data/tema2/daily-bike-rentals.csv")

# #d Trabajamos la estructura: Añadimos las categorías
# #d damos nombre a las estaciones
# #d levels: factores
# #d labels: categorías
data$season <- factor(data$season, levels = c(1,2,3,4), 
                      labels = c("Invierno", "Primavera", "Verano", "Otoño"))
# #d lo mismo para los dias laborales y los que no
data$workingday <- factor(data$workingday, levels = c(0,1),
                          labels = c("Festivo", "De trabajo"))
# #d también el tiempo
data$weathersit <- factor(data$weathersit, levels = c(1,2,3),
                          labels = c("Despejado", "Nublado", "Lluvia/Nieve ligera"))
# #d formato de fecha
data$dteday <- as.Date(data$dteday, format = "%Y-%m-%d")

# #d recordatorio: con attach nos evitamos tener que usar data para acceder a la información
attach(data)

# #d Análisis del alquiler de bicicletas según la estación del año
# #d 2 filas, 2 columnas
# #d generamos un dataframe por cada estación
# #d $cnt: para quedarnos solo con la columna del conteo
par(mfrow=c(2,2))
winter <- subset(data, season == "Invierno")$cnt
spring <- subset(data, season == "Primavera")$cnt
summer <- subset(data, season == "Verano")$cnt
fall   <- subset(data, season == "Otoño")$cnt

# #d Pintamos el histograma
# #d media: pintada de color rojo
# #d mediana: de color azul
hist(winter, prob = TRUE, xlab = "Alquiler diario en invierno", main ="")
# #d curva de la densidad
lines(density(winter))
# #d param v: vertical
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

# #d el paquete de beanplot: diagrama de la judia
# #d se utiliza para mostrar las frecuencias en forma de histograma dentro del las gráficas 
install.packages("beanplot")
library(beanplot)

par(mfrow=c(1,1))
# #d Indicamos las variables según las cuales queremos hacer las segmentación
# #d en azul: nos 
beanplot(data$cnt ~ data$season, col = c("blue", "red", "yellow"))



#causalidad
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

