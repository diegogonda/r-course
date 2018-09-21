housing.data <- read.csv("../data/tema1/housing-with-missing-value.csv",
                         header = TRUE, stringsAsFactors = FALSE)

# #d resumen de las variables, que nos aporta para cada una de las variables de sus estadisticas más básicas
# #d mínimos, máximos, promedios, otros ...
summary(housing.data)

# #d vemos tres formas básicas de eliminar los NAs

# #d ya cnocido, na.omit (opción más radical)
##ELiminar todas las observaciones que contengan algún NA
housing.data.1 <- na.omit(housing.data)
# #d podemos ver los cambios entre este sumary y el anterior
summary(housing.data.1)

##Eliminar las NAs de ciertas columnas
# #d indicamos las variables que queremos eliminar en drop_na
drop_na <- c("rad")
housing.data.2 <- housing.data[ 
  complete.cases(housing.data[,!(names(housing.data))%in% drop_na]),] # #d finalmente sacamos las que no se encuentran en drop_na (!names....)

summary(housing.data.2)

##Eliminar toda una columna
housing.data$rad <- NULL
summary(housing.data)

# #d eliminar varias columnas
drops <- c("rad", "ptratio")
housing.data.3 <- housing.data[,!(names(housing.data) %in% drops)]
summary(housing.data.3)

# #v https://www.udemy.com/r-data-science/learn/v4/t/lecture/8923624
# #d formas completar la información que falta
install.packages("Hmisc")
library(Hmisc)

housing.data.copy1 <- housing.data
# #d impute https://www.rdocumentation.org/packages/Hmisc/versions/4.1-1/topics/impute
# #d cambia NAs con valores constantes (fijo, media, mediana, etc. El que consideremos) 
housing.data.copy1$ptratio <- impute(housing.data.copy1$ptratio, mean) # #d media
housing.data.copy1$rad <- impute(housing.data.copy1$rad, mean)
# #d al hacer el summary ptratio y rad no tienen NAs
summary(housing.data.copy1)

housing.data.copy2 <- housing.data
housing.data.copy2$ptratio <- impute(housing.data.copy2$ptratio, median)
housing.data.copy2$rad <- impute(housing.data.copy2$rad, median)
summary(housing.data.copy2)

# #d en lugar de asignar la media o la mediana como se hizo anteriormente, se le asigna un valor a mano
housing.data.copy3 <- housing.data
housing.data.copy3$ptratio <- impute(housing.data.copy3$ptratio, 18)
housing.data.copy3$rad <- impute(housing.data.copy3$rad, 7)
summary(housing.data.copy3)

# #d paquete para hacernos una idea de los patrones de las variables y tomar mejores decisiones para rellenar información que falta
install.packages("mice")
library(mice)
# #d devuelve una matriz con los valores que se conocen (1) y los que no (0)
# # y un pie de tabla con un resument
md.pattern(housing.data)

# #d visualizar las variables que faltan con un plot 
install.packages("VIM")
library(VIM)

aggr(housing.data,
     col= c('green', 'red'), # #d cambiar los colores de las variables que si están y las que no
     numbers = TRUE, # #d números a la izquiera del plot
     sortVars = TRUE, # #d ordenar de menor a mayor
     labels = names(housing.data), 
     cex.axis = 0.75, # #d cambiar el tamaño de las variables para verlas mejor
     gap = 1, # #d cambiar el espacio entre los plots
     ylab = c("Histograma de NAs", "Patrón") # #d cambiar los títulos
)     
