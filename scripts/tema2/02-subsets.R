# #d extraer un subconjunto (subset) de los datos del dataset

data <- read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)

#Index by position
# #d obtenemos el modelo y el coche (columnas 8 y 9) de los cinco primeros coches
data[1:5, 8:9]
data[1:5, c(8,9)]
#Index by Name
data[1:5, c("model_year", "car_name")]

# & : AND
# | : OR
# ! : NOT
# ==
##Min / Max de mpg 
# #d mínimo y máximo consumo (millas por galeón)
data[data$mpg == max(data$mpg) | data$mpg == min(data$mpg),]

#Filtros con condiciones
# #d obtener del dataframe aquellas con un consumo de 30 mpg y 6 cilindros
data[data$mpg>30 & data$cylinders == 6, c("car_name", "mpg")]
# #d con variables con nombres únicos podemos usar vresioes reducidas cyl == cylinders
data[data$mpg>30 & data$cyl == 6, c("car_name", "mpg")]

#subset
# #d subconjunto
# #d hacemos lo mismo sobre el subconjunto seleccionado
# #d select indica cuáles queremos
subset(data, mpg>30 & cylinders == 6, select = c("car_name", "mpg"))




##FALLOS A TENER EN CUENTA
# error porque le falta la coma después de la condición en filas
data[data$mpg>30]


#Excluir columnas
data[1:5,c(-1,-9)]
data[1:5, -c(1,9)]
#data[1:5, -c("No", "car_name")]
data[1:5, !names(data) %in% c("No", "car_name")]
# #d sacar los carname y mpg con mpg = 15 y 20
data[data$mpg %in% c(15,20), c("car_name", "mpg")]

# #d obtener aquellos que tiene el índice múltiplo de 5
data[c(F,F,F,F,T), c(F, F, T)]
