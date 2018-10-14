# #d https://www.udemy.com/r-data-science/learn/v4/t/lecture/8945178?start=0
# #d vamos a hacer resúmenes

data <- read.csv("../data/tema2/auto-mpg.csv", 
                 header = TRUE,
                 stringsAsFactors = FALSE)

# #d la variable cylinders nos interesa que sea categórica 
# #d por lo que indicamos los valores numéricos y las categorias que vamos a asociar
data$cylinders <- factor(data$cylinders, 
                         levels = c(3,4,5,6,8),
                         labels = c("3cil", "4cil", "5cil", "6cil", "8cil"))

# #d obtenemos el resumen (viene del tema anterior)
summary(data)

# #d la funcion str (structure) no da la información de como R ha generado internamente el objeto
str(data)

# #d aplicamos la funcion summary de una forma más detallada 
# #d devolviendo una tabla de frecuencias absolutas (cuántas veces aparece cada una de ellas)
summary(data$cylinders)
# #d información detallada de mpg
summary(data$mpg)
# #d structura de los cilindros
str(data$cylinders)


install.packages(c("modeest", "raster", "moments"))
# #d La moda es de todos los elementos el mas comu
library(modeest) #moda 
# #d paquete para sacar los cuantiles y el coeficiente de variabilidad
library(raster) #quantiles, cv
# #d calcular el coeficitent de asimetría y el de curtosis
library(moments) # asimetría, curtosis


X = data$mpg

# #d sobre el mínuto 3 del video https://www.udemy.com/r-data-science/learn/v4/t/lecture/8945776?start=228
# #d hay una gráfica

#### Medidas de Centralización

# #d nos indican como de centrados están los datos.
# #d media: suma de las variables entre las cantidad de ellas
mean(X) #sum(X)/length(X) 
# #d mediana: si ordenaramos todos los datos del array, el más pequeño primero el mayo el último, sería el, o los, que están en el medio
median(X)
# #d moda: El valor que más aparece
# #d mfv: most frecuent value
mfv(X)
# #d quartil: es un percentil del 25 y del 75
quantile(X)


#### Medidas de Dispersióno s

# #d evaluamos si los casos están muy dispersos o muy concentrados.
# #d varianza: Como los valores se desplazan de la media 
var(X)
# #d desviación típica: la raíz cuadrada de la varianza
# #d para los casos en que la dimensión (el cuadrado de la varianza) no tiene sentido (ya que ésta introduce una nueva dimensión), aplicamos la desviación
sd(X)
# #d coefición de variación: mide la variabilidad relativa entre la media y la desviación media (x100 porque es un porcentaje)
cv(X) #sd(X)/mean(X)


#### Medidas de asimetría
# #d momento do orden r respecto de la media
# #d es sumar las diferencias entre cada uno de los elementos de la muestra y la media elevado a r
# #d cuando más cercana a cero, mayor simetria
skewness(X)
# #d 
moments::kurtosis(X)

par(mfrow = c(1,1)) # #d los devuelve al valor original
hist(X) # #d muestra una gráfica de los datos

