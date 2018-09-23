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
# #d para ello, tenemos dos etapas
# #d 1) mice, construimos un modelo de datos para intentar obtener valores 
# #d 2) 
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


complete.data <- mice::complete(imputed_data)

housing.data$ptratio <- complete.data$ptratio
housing.data$rad <- complete.data$rad

anyNA(housing.data)



impute_arg <- aregImpute(~ptratio + rad, data = housing.data, n.impute = 5)

impute_arg

impute_arg$imputed$rad

