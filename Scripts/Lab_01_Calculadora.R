# Variables de gastos mensuales
celular <- 240
transporte <- 320
combustibles <- 1400
gimnasio <- 500
alquiler <- 1500
otros <- 1833

# Cálculo de totales
total_mensual <- celular + transporte + combustibles + gimnasio + alquiler + otros
semestre <- total_mensual * 5
anual <- total_mensual * 10

# Vectores para graficar
gastos <- c(celular, transporte, combustibles, gimnasio, alquiler, otros)
nombres <- c("Celular", "Transporte", "Combustibles", "Gimnasio", "Alquiler", "Otros")

barplot(gastos,
        names.arg = nombres,
        col = "lightblue",
        main = "Gastos mensuales",
        ylab = "Monto en pesos",
        ylim = c(0, 2000),
        las = 2)

# Crear tabla de gastos ordenados con nombres
gastos_ordenados <- sort(gastos, decreasing = TRUE)
nombres_ordenados <- nombres[order(gastos, decreasing = TRUE)]

# Mostrar como tabla
data.frame(Categoría = nombres_ordenados,
           Monto = gastos_ordenados)

