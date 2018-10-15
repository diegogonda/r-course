# #d el paquete lattice produce unos gráficos para poder representar relaciones multivariables en las diferentes variables del dataset
# #d es de los paquetes que crea relaciones más complejas entre las variables
auto <- read.csv("../data/tema2/auto-mpg.csv", stringsAsFactors = F)
auto$cylinders = factor(auto$cylinders, 
                        levels = c(3,4,5,6,8),
                        labels = c("3C", "4C", "5C", "6C", "8C"))

# #d dibujar boxplot
# #d dibujamos mpg en función de cylinders
# #d La mediana la pinta como un punto negro
# #d ~ indica que lattice haga un gráfico agrupado en el eje x
# #d NOTA: antes de hacer uso de estas funcionalidades, hay que revisar que hace la virgula 
# #d | en este caso el pipe significa los factores por los que queremos dividir (variables a la izquierda y factores a la derecha)
bwplot(~ auto$mpg | auto$cylinders,
       main = "MPG según cilindrada",
       xlab = "Millas por Galeón",
       layout = c(2,3), aspect = 1)

# #d scatterplot: xyplot
# #d mpg en función del peso y la cilindrada 
xyplot(mpg~weight | cylinders, data = auto,
       main = "Peso vs Consumo vs Cilindrada",
       xlab = "Peso (kg)",
       ylab = "Consumo (mpg)"
      )

# #d Tiene 4 tipos de gráficos
## bwplot, xyplot, densityplot, splom
# #d densityplot
# #d splom
 
# #d cambiar los temas de colores para personalizar los plots
trellis.par.set(theme = col.whitebg())
