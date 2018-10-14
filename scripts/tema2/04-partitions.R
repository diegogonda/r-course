# #d partir los datos en varios conjuntos
# #d para hacer modelos y luego analizar la calidad de los mismos, usaremos dichas particiones
install.packages("caret")
library(caret)
data <- read.csv("../data/tema2/BostonHousing.csv")

# #d para hacer particiones
# #d MEDV, en el dataset original nos indica en que casas podemos vivir con mil dólares
# #d creamos una partición con el 80% de casos (p = 0.8) (en Machine learning se suele usar este porcentaje)
# #d selecciona inteligemente muestras aleatorias de los datos, usando percentiles, para que la muestra sea uniforme
# #d el parámetro list indica si queremos los datos como lista (true) o como vector (false)
training.ids <- createDataPartition(data$MEDV, p = 0.8, list = F)
# #d Conjunto de entrenamiento: obtenemos el dataset de data con los training ids
data.training <- data[training.ids,]
# #d Conjunto de validación: Obtenemos las contrarias a la anteriores
data.validation <- data[-training.ids,]

# #d Otro caso es crear un modelo con el 70% de los casos, y dividir el 30% restante entre los datos de validación y testeo
training.ids.2 <- createDataPartition(data$MEDV, p = 0.7, list = F)
data.training.2 <- data[training.ids.2,]
temp <- data[-training.ids.2,]
# #d usamos el array temp para crear los citados datos de validación y test
validation.ids.2 <- createDataPartition(temp$MEDV, p = 0.5, list = F)
data.validation <- temp[validation.ids.2,]
data.testing <- temp[-validation.ids.2,]


# #d Partir un dataframe en el caso de variables categóricas
# #d como en el caso anterior creamos dos data frames (entrenamiento y validación)
data2 <- read.csv("../data/tema2/boston-housing-classification.csv")
training.ids.3 <- createDataPartition(data2$MEDV_CAT, p = 0.7, list = F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3,]

# #d Funcion que nos crea particiones de dos elementos (entrenamiento: train y validación: val)
# #d target.index: columna con la que vamos a hacer la partición
rda.cb.partition2 <- function(dataframe, target.index, prob) {
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p=prob, list = FALSE)
  list(train = dataframe[training.ids,], val = dataframe[-training.ids,])
}

# #d función para crear particiones de tres elementos (entrenamiento: train, validación: val, testeo: test)
rda.cb.partition3 <- function(dataframe, target.index,
                              prob.train, prob.val){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob.train, list = FALSE)
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  validation.ids <- createDataPartition(temp[,target.index], p = prob.val, list = FALSE)
  list(train = train.data, val = temp[validation.ids,], test = temp[-validation.ids,])
}


# #d partimos por la columna 14
data1 <- rda.cb.partition2(data, 14, 0.8)
data2 <- rda.cb.partition3(data2, 14, 0.7, 0.5)

# #d obtenemos los primeros datos del dataframe
head(data1$val)
head(data2$val)

# #d número de filas
nrow(data)

# #d obtener una muestra aleatoria del dataframe
# #d obtenemos 40 elementos sin elementos repetidos
sample1 <- sample(data$CRIM, 40, replace = F)
