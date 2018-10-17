# #d Video: Diagramas ROC
# #d Nos da información sobre la fiabilidad de nuestra clasificación
# #d No ayuda a determinar la probabilidad de tener exito o fracaso en el test que estemos llevando a cabo
# #d es decir, conocer si estamos obteniendo falsos o ciertos positivos 
# #d REVISAR VIDEO: Explicación del diagrama, muy interesante
install.packages("ROCR")
library(ROCR)

# #d la diferencia entre los dataset es que uno tiene variables numéricas y el otro categóricas
data1 <- read.csv("../data/tema3/roc-example-1.csv")
data2 <- read.csv("../data/tema3/roc-example-2.csv")
#0 -> fallo
#1 -> éxito
# #d Obtenemos un sistema para clasificar los objetos
pred1 <- prediction(data1$prob, data1$class)
# #d calculamos la eficiencia
# #d tpr: true positive rate 
# #d fpr: false positive rate
perf1 <- performance(pred1, "tpr", "fpr")
# #d visibilizamos los datos y la diagonal
plot(perf1)
lines(par()$usr[1:2], par()$usr[3:4])
# #d ¿A partir de que valores estamos seguros de nos va a dar un tpr?, y, ¿en cuales pueden ser fpr?
# #d @ son objetos internos de R
# #d alpha.values => probabilidad de corte
prob.cuts.1 <- data.frame(cut = perf1@alpha.values[[1]],
                          fpr = perf1@x.values[[1]],
                          tpr = perf1@y.values[[1]])
# #d Vemos la cabeza
# #d que nos informa de la posibilidad de que tengamos un tpr o un fpr
head(prob.cuts.1)

tail(prob.cuts.1)
# #d obtenemos todos los que tengan un tpr superior al 80%
# #d Por ejemplo, al imprimir estos datos (prob.cuts) nos dice que un corte del 49%, es un caso de éxito en el 81.4% 
# #d de los casos, por lo que nosotros debemos catalogarlo automáticamente como un éxito
# #d aunque debemos encontrar un balance
# #d NOTA: trp y fpr => no son contradictorios
prob.cuts.1[prob.cuts.1$tpr>=0.8,]



pred2 <- prediction(data2$prob, data2$class, label.ordering = c("non-buyer", "buyer"))
perf2 <- performance(pred2, "tpr", "fpr")
plot(perf2)
lines(par()$usr[1:2], par()$usr[3:4])
