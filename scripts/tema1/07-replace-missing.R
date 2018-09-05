data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")

# #d A los valores que faltan se les asigna el promedio de la variable income
data$Income.mean <- ifelse(is.na(data$Income), 
                           mean(data$Income, na.rm = TRUE),
                           data$Income
                           )
# #d OJO! porque este tipo de asignación de valor a los NA no vale para todos los casos. Existen casos de variables categóricas en los
# #d que tenemos que utilizar otras estrategias
# #d Para este tipo de casos, en Big Data extraeremos valores aleatorios de una muestra aleatoria entre los valores que NO faltan
# #d Esto lo haremos con la funcion rand.impute

#x es un vector de datos que puede contener NA
rand.impute <- function(x) {
  # missing contiene un vector de valores T/F dependiendo del NA de x
  missing <- is.na(x)
  #n.missing contiene cuantos valores son NA dentro de x
  n.missing <- sum(missing)
  #x.obs son los valores conocidos que tienen dato diferente de NA en x
  x.obs <- x[!missing]
  #por defecto, devolveré lo mismo que había entrado por parámetro
  imputed <- x
  #en los valores que faltaban, los reemplazamos por una muestra
  #de los que si conocemos (MAS) 
  # #d MAS: Muestra Aleatoria Simple
  # #d con el código anterior hemos sustituido los valores NA por muestras que si conocemos de forma aleatoria
  imputed[missing] <- sample(x.obs, n.missing, replace = TRUE)
  return (imputed)
}


random.impute.data.frame <- function(dataframe, cols){
  names <- names(dataframe)
  for(col in cols){
    # #d concatena el nombre de la columna original con imputed
    name <- paste(names[col], "imputed", sep = ".")
    dataframe[name] = rand.impute(dataframe[,col])
  }
  # #d no necesitamos el return para recuperar los valores
  dataframe
}


data <- read.csv("../data/tema1/missing-data.csv", na.strings = "")
data$Income[data$Income==0]<-NA
data <- random.impute.data.frame(data, c(1,2))

