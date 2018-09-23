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

# #d Ejemplo
# #d (original) |         | Murder | Assault | UrbanPop | Rape |
# #d            | Alabama | 13.2   | 236     | 58       | 21.2 | 
# #d            | Alaska  | 10     | 263     | 48       | 44.5 |

# #d (resultado)| state | X       | Rape   | crime_type | arrest_estimate |
# #d            | 1     | Alabama | 21.2   | Murder     | 13.2            | 
# #d            | 2     | Alaska  | 10     | Murder     | 10              |

# #d con lo que obtenemos los resultados mucho mejor ordenados

crime.data.1 <- gather(crime.data,
                       key = "crime_type", 
                       value = "arrest_estimate",
                       Murder : UrbanPop) # #d desde:hasta

crime.data.2 <- gather(crime.data,
                       key = "crime_type",
                       value = "arrest_estimate",
                       -state)

crimate.data.3 <- gather(crime.data,
                         key = "crime_type",
                         value = "arrest_estimate",
                         Murder, Assault)


crime.data.4 <- spread(crime.data.2, 
                       key = "crime_type",
                       value = "arrest_estimate") 


crime.data.5 <- unite(crime.data,
                      col = "Murder_Assault",
                      Murder, Assault, 
                      sep = "_")


crime.data.6 <- separate(crime.data.5,
                         col= "Murder_Assault",
                         into = c("Murder", "Assault"),
                         sep = "_")
