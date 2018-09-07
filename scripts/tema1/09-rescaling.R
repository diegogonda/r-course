install.packages("scales")
library(scales)
students <- read.csv("../data/tema1/data-conversion.csv")

# #d La función rescales coge el valor más alto y le asigna 1, al más bajo le asigna 0. A los valores intermedios 
# #d les asigna el valor proporcional entre 0 y 1
students$Income.rescaled <- rescale(students$Income)

# #d esta transformación lineal es equivalente a rescale
(students$Income - min(students$Income))/
  (max(students$Income) - min(students$Income))

# #d rescalar el dataset en un rango de 0 a 100
# #d "to" nos permite hacer este reescalado
rescale(students$Income, to = c(0, 100))

# #d funcion para rescalar varios valores
rescale.many <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    # #d obtenemos el nombre de la columna del bucle y concatenar con rescaled
    name <- paste(names[col], "rescaled", sep = ".")
    dataframe[name] <- rescale(dataframe[,col]) 
  }
  # #d cat: homologable a cat en linux
  cat(paste("Hemos reescalado ", length(cols), " columna(s)"))
  dataframe
}

# #d reescalamos las columnas 1 y 4
students <- rescale.many(students, c(1,4))
