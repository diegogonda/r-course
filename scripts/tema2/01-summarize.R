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
library(modeest) #moda
library(raster) #quantiles, cv
library(moments) # asimetría, curtosis


X = data$mpg

#### Medidas de Centralización
mean(X) #sum(X)/length(X)
median(X)
mfv(X)
quantile(X)

#### Medidas de Dispersión
var(X)
sd(X)
cv(X) #sd(X)/mean(X)

#### Medidas de asimetría
skewness(X)
moments::kurtosis(X)

par(mfrow = c(1,1))
hist(X)

