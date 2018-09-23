# #d modelos predictivos para imputar datos
# #d la biblioteca mice se uso anteriormente en
# #d https://github.com/diegogonda/r-course/blob/master/scripts/tema1/12-missing-data.R
library(mice)

housing.data <- read.csv("../data/tema1/housing-with-missing-value.csv",
                         header = TRUE,
                         stringsAsFactors = FALSE)

# #d con el dataframe creado podemos llevar a cabo una imputacióin de datos multivariante
# #d ptratio y rad son las que sabemos que tienen NAs
columns <- c("ptratio", "rad")

# #d https://www.rdocumentation.org/packages/mice/versions/3.3.0/topics/mice
# #d vamos a inferir la informacion de ptratio y rad
# #d m: el número de iteración de imputaciones que queremos hacer (por defecto 5 cálculos) a mayor m, mayor precision y menor velocidad de cálculo
# #d maxit: el número de máximo de optimizaciones que le vamos a hacer a un parámetro
# #d method: método usado
# #d   en este caso: pmm predictive mean machine, es decir que va a intentar predecir el valor promedio de los datos
# #d seed: semilla, evita que el modelo sea aleatorio (??? revisar)

# #d con esta funcion, a través de los cálculos se intenta inferir el valor probabilístico de las variables con NA
# #d para ello, con mice, construimos un modelo de datos para intentar obtener valores 
imputed_data <- mice(housing.data[,names(housing.data) %in% columns],
                     m = 5, 
                     maxit = 50, 
                     method = "pmm",
                     seed = 2018)
## pmm - comparación predictiva de medias
## logreg - regresión logistica
## polyreg - regresión logística politómica
## polr - modelo de probabilidades proporcionales. 

summary(imputed_data)

# #d complete es de mice pero existe en otra clase, por lo que tenemos que indicarle el paquete (mice::)
# #d complete generamos las dos variables completas con los valores predecidas por el modelo de datos
complete.data <- mice::complete(imputed_data)

# #d asingamos los valores predecidos a los originales (ptratio y rad)
housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

# #d anyNA: localiza los NAs que tiene un dataframe
anyNA(housing.data)

# #d aregImpute nos permite hacer inferencia de datos usando regresiones aditivas, técnicas de boostraping, o usando la comparación de medias predictivas
# #d el método identifica el tipo de dato
impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

# #d devuelve un valor entre 0 y 1, que nos indica la calidad del cálculo 
impute_arg

impute_arg$imputed$rad

