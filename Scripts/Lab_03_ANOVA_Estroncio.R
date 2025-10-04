# Laboratorio 3 – ANOVA de una vía con pruebas post hoc
# Autor: Francisco Silva Ruiz – Matrícula 1314498
# Curso: Experimentación y Métodos Estadísticos – Maestría en Ciencias Forestales, UANL

# 📦 Cargar paquetes necesarios
library(readxl)
library(tidyr)
library(agricolae)

# 📂 Importar datos desde Excel
datos <- read_excel("estroncio_sitios.xlsx")  # Asegúrate de tener este archivo en tu carpeta

# 🔄 Transformar a formato largo si es necesario
datos_largos <- pivot_longer(datos, cols = -Sitio, names_to = "Variable", values_to = "Concentracion")

# 🧮 ANOVA de una vía
modelo_anova <- aov(Concentracion ~ Sitio, data = datos_largos)
summary(modelo_anova)

# 🧪 Prueba LSD
prueba_lsd <- LSD.test(modelo_anova, "Sitio", p.adj = "none")
print(prueba_lsd$groups)

# 🧪 Prueba Tukey HSD
tukey <- TukeyHSD(modelo_anova)
print(tukey$Sitio)

# 📊 Gráfico de grupos homogéneos
plot(prueba_lsd, main = "Grupos homogéneos según LSD")

# 📊 Gráfico de Tukey
plot(tukey, las = 2, main = "Comparaciones múltiples – Tukey HSD")

