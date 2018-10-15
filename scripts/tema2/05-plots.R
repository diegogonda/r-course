# #d representaciones
auto <- read.csv("../data/tema2/auto-mpg.csv")
# #d sobreescribimos la columna cilindros para que sea una categoria
auto$cylinders <- factor(auto$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))
# #d hace que las variables de auto sean variables de R
# #d con lo que podemos instanciarlos directamente, ahorrándonos los $
attach(auto)
head(cylinders)

#Histograma de frecuencias
# #d representación de la aceleración del dataframe de la aceleración
# #d nos permite ver la forma de los datos (medidas de centralización, dispersión)
# #d parametro break: número de divisiones
# #d parametro rainbow: cambia los colores de las barras para poder diferenciarlas
# #d Frecuencias: Cantidad de veces que se repite
hist(acceleration,
     col = rainbow(12),
     xlab = "Aceleración",
     ylab = "Frecuencias",
     main = "Histograma de las aceleraciones",
     breaks = 12)

# #d Los histogramas son muy sensibles al numero de particiones
# #d Necesitamos que las frecuencias sean relativas para poder combinarlas con la función de densidad (de forma que al sumar todo, sume 1)
# #d prob: pasamos de frecuencias absolutas a relativas
hist(mpg, breaks = 16, prob = T)
# #d Sobre el histograma, representamos la función de densidad puesto que por ella misma no aporta demasiada información
# #d la función de densidad no sufre si cambiamos el número de breaks
lines(density(mpg))


#Boxplots
# #d diagrama de caja y bigotes
boxplot(mpg, xlab = "Millas por Galeón")
boxplot(mpg ~ model_year, xlab = "Millas por Galeón (por año)")
boxplot(mpg ~ cylinders, xlab = "Consumo por Número de cilindros")
# #d pintar una caja para cada una de las variables numéricas
boxplot(auto)

#Scatterplot
# #d pintar dos variables númericas: la primera en x y la segunda en y
# #d nos puede indicar como las variables se relacionan entre ellas
# #d lo conseguimos mediante el símbolo ~, con el que pintamos los conjuntos
# #d por ejemplo la potencia con el consumo, el peso con el consumo, u otros..
# #d parametro type: con n, vale none y no pinta nada
plot(mpg ~ horsepower, type = "n") # #d (y, x) sirve para ver tendencias
# #d creamos un modelo lineal de las  millas por galeón en funcion de los cavallos de potencia
linearmodel <- lm(mpg ~ horsepower)
# #d Pintamos una recta de regresión lineal, para que nos aporte más información
abline(linearmodel)

#Agregar colores para cada cilindrada
with(subset(auto, cylinders=="8cil"), 
     points(horsepower, mpg, col = "red")) # #d x: horsepower, y: mpg, color: rojo
with(subset(auto, cylinders == "6cil"),
     points(horsepower, mpg, col = "yellow"))
with(subset(auto, cylinders == "5cil"),
     points(horsepower, mpg, col = "green"))
with(subset(auto, cylinders == "4cil"),
     points(horsepower, mpg, col = "blue"))
with(subset(auto, cylinders == "3cil"),
     points(horsepower, mpg))

#Matriz de Scatterplots
# #d indicamos las variables que creemos que tienen relación
pairs(~mpg+displacement+horsepower+weight)


#Combinación de plots con par
# #d par antiguo
old.par <- par()
# #d vemos el contenido de par
# #d donde podremos revisar las variables que tiene y modificar sus valores por defecto
old.par
# #d una de ellas es mfrow: indica el número de filas y columnas que queremos en nuestra distribución, 
# #d por defecto: 1 fila y una 1 columna
# #d queremos pinta 1 fila y 2 columnas
par(mfrow = c(1,2))
# #d existen otras variables como mfcol, ...

# #d pintamos un dos nuevos gráficos
with(auto, {
  plot(mpg ~ weight, main = "Peso vs Consumo")
  plot(mpg ~ acceleration, main = "Aceleración vs Consumo")
  }
)
# #d pero ojo porque al cambiar los parámetros de par, no podremos pintar con sus representaciones por defecto
# #d así que las devolvemos a sus valores originales
par(old.par)
