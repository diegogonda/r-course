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


# #d Video 52: Gráficos quantil
# #d Los cuantiles o percentiles, son puntos específicos de la muestra que dejan 
# #d parte de datos por debajo de ellos (por ejemplo la distribución normal de Gauss, la campana de Gauss)
# #d 
s <- seq(0.01, 0.99, 0.01)
s
qn <- qnorm(s)
qn
df <- data.frame(p = s, q = qn)

sample <- rnorm(200)
sample
quantile(sample, probs = s)


#qqnorm
trees
par(mfrow=c(1,1))
qqnorm(trees$Height)

qqnorm(randu$x)

#qqplot
randu
n <- length(randu$x)
n
y <- qunif(ppoints(n))
y
qqplot(y, randu$x)



chi3 <- qchisq(ppoints(30), df = 3)
n30  <- qnorm(ppoints(30))
qqplot(n30, chi3)

qqplot(chi3, chi3)

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
