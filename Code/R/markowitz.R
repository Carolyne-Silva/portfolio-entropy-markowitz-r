library(quantmod)

# Lista de ações e datas de referência
tickers <- c("AAPL", "MSFT", "GOOGL", "AMZN", "META", "NVDA", "ORCL", "CRM", "INTC", "AMD")
datas_referencia <- as.Date(c("2023-01-02", "2023-06-30", "2023-12-29", 
                              "2024-06-28", "2024-12-31", "2025-06-30"))

# Função para obter preço ajustado em data específica
getPriceAtDate <- function(serie, date) {
  date <- as.Date(date)
  serie_completa <- na.omit(serie)
  if (sum(index(serie_completa) <= date) == 0) return(NA)
  last(serie_completa[index(serie_completa) <= date], 1)[[1]]
}

# Matriz para armazenar retornos
retornos_semestrais <- matrix(nrow = 5, ncol = length(tickers))
colnames(retornos_semestrais) <- tickers
rownames(retornos_semestrais) <- c("1 Sem", "2 Sem", "3 Sem", "4 Sem", "5 Sem")

# Loop sobre cada ação
for (tk in tickers) {
  # Obter dados históricos
  dados <- tryCatch(
    {
      getSymbols(tk, src = "yahoo", from = "2022-12-20", auto.assign = FALSE)
    },
    error = function(e) {
      message(paste("Erro ao baixar", tk, ":", e$message))
      NULL
    }
  )
  
  if (is.null(dados)) next
  
  # Extrair preços ajustados
  precos_ajustados <- Ad(dados)
  
  # Obter preços nas datas de referência
  precos_ref <- sapply(datas_referencia, function(d) {
    getPriceAtDate(precos_ajustados, d)
  })
  
  # Calcular retornos simples entre períodos consecutivos
  for (i in 2:length(precos_ref)) {
    if (!any(is.na(precos_ref[(i-1):i]))) {
      retornos_semestrais[i-1, tk] <- (precos_ref[i] - precos_ref[i-1]) / precos_ref[i-1]
    }
  }
}

# Converter para dataframe (versão numérica para gráfico)
df_retornos_plot <- as.data.frame(retornos_semestrais * 100)  # Convertendo para porcentagem
df_retornos_plot$Semestre <- factor(rownames(df_retornos_plot), 
                                   levels = rownames(df_retornos_plot))

# Criar versão longa para ggplot
library(tidyr)
library(ggplot2)
df_long <- pivot_longer(df_retornos_plot, 
                       cols = -Semestre, 
                       names_to = "Acao", 
                       values_to = "Retorno")

# Criar gráfico de linhas
ggplot(df_long, aes(x = Semestre, y = Retorno, group = Acao, color = Acao)) +
  geom_line(linewidth = 1) +
  geom_point(size = 3) +
  labs(title = "Retornos Semestrais das Ações de Tecnologia",
       x = "Semestre",
       y = "Retorno Percentual (%)",
       color = "Ação") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, size = 14, face = "bold"),
    axis.title = element_text(size = 12),
    axis.text = element_text(size = 10),
    axis.text.x = element_text(angle = 45, hjust = 1),
    legend.position = "right",
    panel.grid.major = element_line(color = "gray90"),
    panel.grid.minor = element_blank()
  ) +
  scale_y_continuous(labels = function(x) paste0(x, "%")) +
  scale_color_viridis_d(option = "D", end = 0.9)  # Escala de cores viridis


# Resultado final
print(df_retornos_plot)

# Exportar
#write.csv(carteira_retorno, file = "C:/Users/scaro/Desktop/IC/Data/retorno_carteira.csv", row.names = TRUE)
