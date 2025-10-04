# Laboratorio 2 – Contraste de medias con la base iris

# Cargar base de datos
data(iris)

# Filtrar especies de interés
versicolor <- subset(iris, Species == "versicolor")
virginica <- subset(iris, Species == "virginica")

# Estadísticas descriptivas
mean_versicolor <- mean(versicolor$Petal.Length)
sd_versicolor <- sd(versicolor$Petal.Length)

mean_virginica <- mean(virginica$Petal.Length)
sd_virginica <- sd(virginica$Petal.Length)

# Prueba t de Welch
t_test <- t.test(versicolor$Petal.Length, virginica$Petal.Length)

# Tamaño del efecto (Cohen's d)
n1 <- length(versicolor$Petal.Length)
n2 <- length(virginica$Petal.Length)
pooled_sd <- sqrt(((sd_versicolor^2) + (sd_virginica^2)) / 2)
cohen_d <- (mean_versicolor - mean_virginica) / pooled_sd

# Gráfico comparativo
boxplot(Petal.Length ~ Species, data = iris,
        col = c("lightgreen", "lightblue", "lightpink"),
        main = "Comparación de Petal.Length entre especies",
        ylab = "Largo del pétalo (cm)")

# Mostrar resultados
list(
  Media_versicolor = mean_versicolor,
  Media_virginica = mean_virginica,
  SD_versicolor = sd_versicolor,
  SD_virginica = sd_virginica,
  Prueba_t = t_test,
  Cohen_d = cohen_d
)

