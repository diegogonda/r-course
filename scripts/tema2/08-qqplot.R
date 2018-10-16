# #d Vídeo 51: La técnica de validación cruzada: Cross Validation
# #d se usa para evitar que las particiones de datos estean sesgadas
# #d debemos realizar diferentes modelizaciónes para quedarnos con la mejor de ellas
# #d se obtene la medida del error y se obtiene una media de este para obtener cuál es la calidad del sistema
# #d se analizan los siguiente métodos

# #d Validación cruzada de K iteraciones
# #d lo tipo es k = 10 => ten fold cross validation

# #d Random Cross Validation 
# #d Escogemos llos datos de prueba de forma aleatoria

# #d Leave one out Cross Validation
# #d Todos los datos son de entrenamiento menos uno que es de prueba
# #d es muy bueno pero tiene demasiado coste computacional


# #d Video 52: Gráficos quantil - quantil
# #d Los cuantiles o percentiles, son puntos específicos de la muestra que dejan 
# #d parte de datos por debajo de ellos (por ejemplo la distribución normal de Gauss, la campana de Gauss)
# #d Muy útiles para las regresiones lineales
# #d Vemos diferentes tipos de distribuciones

# #d creamos una recuencia desde 0.01 hasta 0.99 con saltos de 0.01
s <- seq(0.01, 0.99, 0.01)
s
# #d analizamos los percentiles de la noraml (en este ccaso la normal estandar)
qn <- qnorm(s)
# #d aquí tendriamos desde -2.32 (0.01% de los datos), el primer percentil hasta el 2.32 (0.99% de los datos) 
qn
# #d 
df <- data.frame(p = s, q = qn)

# #d generamos una distribución con 200 muestras desde la normal
sample <- rnorm(200)
sample
# #d obtenemos sus cuántiles
quantile(sample, probs = s)


#qqnorm
# #d gráficos qqplot frente a una normal
# #d dataset de R con información de árboles
trees
par(mfrow=c(1,1))
# #d vemos la distribución de la altura de los árboles
qqnorm(trees$Height)

qqnorm(randu$x)

#qqplot
randu
n <- length(randu$x)
n
# #d genreemoa una distribución de cuantiles uniformes
# #d ppoints genera un número de dado de probabilidades (400 probabilidades generadads (NOTA: n vale 400))
y <- qunif(ppoints(n))
y
# #d vemos que randux tiene una distribución uniforme porque es aleatoria
qqplot(y, randu$x)


# #d representación de una funcion de cuantiles de la chisp usando 30 probabilidades
# #d df: degree freedom: grados de libertal
chi3 <- qchisq(ppoints(30), df = 3)
# #d 
n30  <- qnorm(ppoints(30))
# #d pintamos la distribución confrontandola ente el ejex x (n30) y el eje y (chi3)
qqplot(n30, chi3)

qqplot(chi3, chi3)

# #d distribuciones de Cauchy
cauchy <- qcauchy(ppoints(30))
qqplot(n30, cauchy)

par(mfrow=c(1,2))
x <- seq(-3, 3, 0.01)
plot(x, dnorm(x))
plot(x, pnorm(x))

plot(x, dchisq(x, df=3))
plot(x, pchisq(x, df=3))

plot(x, dcauchy(x))
plot(x, pcauchy(x))
