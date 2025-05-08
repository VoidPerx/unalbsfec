# Carga de librerías necesarias
library(tidyverse)
library(mgcv)
library(ggalign)
library(factoextra)
library(viridis)
library(dendextend)

# Generación de datos simulados (reemplazar con tus datos reales)
set.seed(123)
datos_hermetia <- tibble(
  temperatura = runif(100, 20, 35),
  humedad = runif(100, 50, 80),
  densidad_larval = runif(100, 1, 10),
  biomasa = rnorm(100, mean = 50, sd = 10)
)

# Ajuste del modelo GAM
modelo_gam <- gam(
  biomasa ~ s(temperatura, bs = "tp") + 
            s(humedad, bs = "tp") + 
            s(densidad_larval, bs = "tp") + 
            te(temperatura, humedad),
  data = datos_hermetia, 
  method = "REML"
)

# Predicciones para mapa de calor
grid <- expand.grid(
  temperatura = seq(20, 35, length.out = 100),
  humedad = seq(50, 80, length.out = 100)
)
grid$pred_biomasa <- predict(modelo_gam, newdata = grid)

# Gráfico de mapa de calor
heatmap_plot <- ggplot(grid, aes(x = temperatura, y = humedad, fill = pred_biomasa)) +
  geom_tile() +
  scale_fill_viridis_c(option = "C") +
  labs(title = "Mapa de Calor: Biomasa en función de Temperatura y Humedad",
       x = "Temperatura (°C)",
       y = "Humedad (%)",
       fill = "Biomasa") +
  theme_minimal()

# Gráficos de efectos parciales
efectos_parciales <- plot.gam(modelo_gam, pages = 1, seWithMean = TRUE)

# Clustering jerárquico basado en variables ambientales
pca <- prcomp(datos_hermetia %>% select(temperatura, humedad, densidad_larval), scale. = TRUE)
distancias <- dist(pca$x[, 1:2])
hc <- hclust(distancias, method = "ward.D2")
dendrograma <- as.dendrogram(hc)

# Dendrograma visual
dendrogram_plot <- ggdendrogram(dendrograma, theme_dendro = TRUE) +
  labs(title = "Dendrograma: Agrupación de Condiciones Experimentales") +
  theme_minimal()

# Gráficos marginales
marginal_temp <- datos_hermetia %>%
  group_by(temperatura) %>%
  summarise(total_biomasa = sum(biomasa)) %>%
  ggplot(aes(x = temperatura, y = total_biomasa)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Biomasa Total por Temperatura", x = "Temperatura (°C)", y = "Biomasa Total") +
  theme_minimal()

marginal_hum <- datos_hermetia %>%
  group_by(humedad) %>%
  summarise(total_biomasa = sum(biomasa)) %>%
  ggplot(aes(x = humedad, y = total_biomasa)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  labs(title = "Biomasa Total por Humedad", x = "Humedad (%)", y = "Biomasa Total") +
  theme_minimal()

# Visualización integrada con ggalign
final_plot <- ggalign(
  heatmap_plot,
  marginal_temp,
  marginal_hum,
  dendrogram_plot,
  ncol = 2,
  nrow = 2,
  labels = c("A", "B", "C", "D")
)

# Guardar visualización
ggsave("visualizacion_integrada.png", final_plot, width = 14, height = 10)

# Mostrar visualización
print(final_plot)
