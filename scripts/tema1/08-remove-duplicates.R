family.salary = c(40000, 60000, 50000, 80000, 60000, 70000, 60000)
family.size = c(4, 3, 2, 2, 3, 4, 3)
family.car = c("Lujo", "Compacto", "Utilitario", "Lujo", 
               "Compacto", "Compacto", "Compacto")

family <- data.frame(family.salary, family.size, family.car)

# #d elimina las filas que estén duplicadas todas las columnas
family.unique <- unique(family)
# #d duplicated devuelve un vector de T/F indicando si una fila está duplicada (en el caso de la primera ocurrencia indica FALSE, y las subsiguientes indica TRUE)
family.duplicated <- duplicated(family)

# #d obtener los datos de las filas duplicadas
family[duplicated(family),]
