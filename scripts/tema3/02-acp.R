# #d Video: Análisis de las componentes principales
# #d URL: https://www.udemy.com/r-data-science/learn/v4/t/lecture/8961386?start=0
# #d ACP: Análisis de Componentes principales
# #d técnica para reducir la dimensionalidad, transformando los datos que tengan muchas dimensiones, 
# #d aquellas que son esenciales por definir la estructura basica de los datos
# #d con el objetivo de reemplazar un número de variables grande en uno menor con un número de menor
# #d de ellas que no tengan relación siempre sin perder datos ni información relevante
usarrests <- read.csv("../data/tema3/USArrests.csv", stringsAsFactors = F)
# #d Cambiamos el identificador de la final, por un dato de la columna, en este caso los estados de EEUU
rownames(usarrests) <- usarrests$X 
# #d eliminamos la columna X, antigua columna de los nombres de los estados
usarrests$X <- NULL
head(usarrests)

# #d Vamos a calcular para cada una de las columnas la varianza de cada una de la variables | 2, indica la columna
# #d Vemos que la que más varia de una estaod a otro es la de los asaltos
apply(usarrests, 2, var)

# #d escalamos y centramos: Perder la variabilidad de una variables a otras
# #d centrar: resta la media
# #d escalar: divide por la desviación típica
acp <- prcomp(usarrests, 
              center = TRUE, scale = TRUE)
print(acp)

# #d de lo impreso, los estadisticos suelen quedarse con el codo más pronunciado, 
# #d en este caso la primera componente principal PC1
# #d es decir, como se indicaba al principio, intentamos eliminar aquellas dimensiones 
# #d que nos aportan menos para reducir los datos a analizar
plot(acp, type = "l")

summary(acp)

# #d pintmaos el acp, correctamente
# #d REVISAR EL VÍDEO: MUY INTERESANTE
# #d minuto: 
biplot(acp, scale = 0)

# #d extraer las PCX
pc1 <- apply(acp$rotation[,1]*usarrests, 1, sum)
pc2 <- apply(acp$rotation[,2]*usarrests, 1, sum)
# #d asigamos a usarrest
# #d teniendo las dos primeras componentes principales, que explican el 86% de los casos
# #d y teniendo un dataframe mucho más liviano
usarrests$pc1 <- pc1 
usarrests$pc2 <- pc2
usarrests[,1:4] <- NULL
