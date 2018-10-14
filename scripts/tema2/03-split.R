#split / unsplit
data <- read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)

# #d divisiones de un dataframe para obtener datos
# #d en este caso hacemos una lista de 5 elementos (3 cilindros, 4, 5, 6 y 8)
carslist <- split(data, data$cylinders)
carslist[1] # #d el primero de la lista, los coches con 3 cilindros
carslist[[1]] # #d dataframe de carslist[1]

# #d structura de del list
str(carslist[1])

names(carslist[[1]])
