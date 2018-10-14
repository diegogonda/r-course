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
# #d Frecuencias: Cantidad de veces que se repite
hist(acceleration,
     col = rainbow(12),
     xlab = "Aceleración",
     ylab = "Frecuencias",
     main = "Histograma de las aceleraciones",
     breaks = 12)

# #d prob
hist(mpg, breaks = 16, prob = T)
lines(density(mpg))


#Boxplots
# #d diagrama de caja y bigotes
boxplot(mpg, xlab = "Millas por Galeón")
boxplot(mpg ~ model_year, xlab = "Millas por Galeón (por año)")
boxplot(mpg ~ cylinders, xlab = "Consumo por Número de cilindros")
boxplot(auto)

#Scatterplot
# #d pintar dos variables númericas: la primera en x y la segunda en y
# #d nos puede indicar como las variables se relacionan entre ellas
# #d por ejemplo la potencia con el consumo, el peso con el consumo, u otros..
plot(mpg ~ horsepower, type = "n") # #d (y, x) sirve para ver tendencias
linearmodel <- lm(mpg ~ horsepower)
abline(linearmodel)
#Agregar colores para cada cilindrada
with(subset(auto, cylinders=="8cil"), 
     points(horsepower, mpg, col = "red"))
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
old.par <- par()
old.par
par(mfrow = c(1,2))

with(auto, {
  plot(mpg ~ weight, main = "Peso vs Consumo")
  plot(mpg ~ acceleration, main = "Aceleración vs Consumo")
}
)

par(old.par)
