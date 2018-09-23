# #d Paquete para ordenar datos
install.packages("tidyr")
library(tidyr)

crime.data <- read.csv("../data/tema1/USArrests.csv", 
                       stringsAsFactors = FALSE)

View(crime.data)

# #d añadimos una columna adicional a data: cbind
# #d en este caso añadimos una columa con los id (state) de cada estado (según su posición)
crime.data <- cbind(state = rownames(crime.data), crime.data)

# #d Unir información: gather
# #d Colapsamos varias columnas en pares de clave valor
# #d key crime_type => obtendremos una columna cuyos valores tendrán el nombre la columna asignada
# #d value arrest_estimate => Obteneremos una columna con valores originales de la columa

# #d Ejemplo 1
# #d (original) |         | Murder | Assault | UrbanPop | Rape |
# #d            | Alabama | 13.2   | 236     | 58       | 21.2 | 
# #d            | Alaska  | 10     | 263     | 48       | 44.5 |

# #d (resultado)| state | X       | Rape   | crime_type | arrest_estimate |
# #d            | 1     | Alabama | 21.2   | Murder     | 13.2            | 
# #d            | 2     | Alaska  | 10     | Murder     | 10              |

# #d con lo que obtenemos los resultados mucho mejor ordenados en FORMATO DE DICCIONARIO
crime.data.1 <- gather(crime.data,
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder : UrbanPop) # #d desde:hasta

# #d resumir todas las variables menos 1 (state con un menos delante)
# #d en excel y mk se tablas de doble entrada
crime.data.2 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       -state)

# #d resumir sólo Murder y Assault
crimate.data.3 <- gather(crime.data,
                         key = "crime_type",
                         value = "arrest_estimate",
                         Murder, Assault)

# #d repartir las claves y valores por columnas: spread
# #d es la función "contraria" de gather
# #d columna de clave es crime_type, del cuál obtiene los nombres de las columnas
# #d en el ejemplo 1, obtendriamos, partiendo del resultado, la tabla original
crime.data.4 <- spread(crime.data.2, 
                       key = "crime_type",
                       value = "arrest_estimate") 

# #d tomar varias columnas y unificarlas en una única
# #d En el ejemplo unificaremos Murder asault
# #d en este caso queda raro porque ambas son numéricas y quedan como xxxx_yyy
# #d pero es muy util para optimizar datos como nombres y apellidos, dni y letras, etc.
crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault, 
                      sep = "_")

# #d separar los datos de una columna en dos
# #d es la opetacion contraria de unite
crime.data.6 <- separate(crime.data.5,
                         col= "Murder_Assault",
                         into = c("Murder", "Assault"),
                         sep = "_")
