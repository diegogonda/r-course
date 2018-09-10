# #d trabajo de standarización de variables usando técnicas de normalización
housing <- read.csv("../data/tema1/BostonHousing.csv")

# #d normalizamos con scale, que sólo sirve para variables numéricas
# #d algo de teoría https://es.wikipedia.org/wiki/Distribuci%C3%B3n_normal
# #d explicación en el vídeo (aprox. min. 4:30) https://www.udemy.com/r-data-science/learn/v4/t/lecture/8919556?start=15#
# #d scale hace esto https://es.wikipedia.org/wiki/Distribuci%C3%B3n_normal#Estandarizaci%C3%B3n_de_variables_aleatorias_normales
housing.z <- scale(housing, center = TRUE, scale = TRUE)
housing.mean <- scale(housing, center = TRUE, scale = FALSE) # #d ajustamos el promedio
housing.sd <- scale(housing, center = FALSE, scale = TRUE)
housing.none <- scale(housing, center = FALSE, scale = FALSE) # #d devuelve el mismo dataset

#sd = sqrt(sum(x^2)/(n-1))

# #d scalar dataframe manteniendo el dataset original
scale.many = function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    name <- paste(names[col], "z", sep = ".")
    dataframe[name] <- scale(dataframe[,col])
  }
  cat(paste("Hemos normalizado ", length(cols), " variable(s)"))
  dataframe
}

housing <- scale.many(housing, c(1, 3, 5:8))
