# Carregar pacotes
library(quantmod)

# Lista de 10 ações do setor de tecnologia
tickers <- c("AAPL", "MSFT", "GOOGL", "AMZN", "META", "NVDA", "ORCL", "CRM", "INTC", "AMD")
empresas <- c("Apple", "Microsoft", "Alphabet", "Amazon", "Meta", "Nvidia",
              "Oracle", "Salesforce", "Intel", "AMD")

# Quantidades compradas
quantidades <- c(20, 15, 10, 8, 12, 6, 18, 10, 30, 25)

# Data de compra
data_compra <- as.Date("2023-01-02")

# Buscar dados desde alguns dias antes
getSymbols(tickers, src = "yahoo", from = data_compra - 7, auto.assign = TRUE)

# Função segura para obter o preço de compra
get_preco_compra <- function(tk, data_compra) {
  serie <- Cl(get(tk))
  datas_validas <- index(serie)
  data_util <- datas_validas[which(datas_validas >= data_compra)[1]]
  if (is.na(data_util)) return(NA)  # Não há dados após a data
  as.numeric(serie[as.character(data_util)])
}

# Aplicar função segura
precos_compra <- sapply(tickers, get_preco_compra, data_compra = data_compra)

# Preços atuais
precos_atuais <- sapply(tickers, function(tk) {
  as.numeric(tail(Cl(get(tk)), 1))
})

# Cálculos
valor_compra <- precos_compra * quantidades
valor_atual <- precos_atuais * quantidades
lucro_abs <- valor_atual - valor_compra
lucro_perc <- round((lucro_abs / valor_compra) * 100, 2)
participacao <- round((valor_atual / sum(valor_atual)) * 100, 2)

# Criar dataframe final
carteira <- data.frame(
  Empresa = empresas,
  Ticker = tickers,
  Quantidade = quantidades,
  Preço_Compra = round(precos_compra, 2),
  Preço_Atual = round(precos_atuais, 2),
  Valor_Compra = round(valor_compra, 2),
  Valor_Atual = round(valor_atual, 2),
  Lucro = round(lucro_abs, 2),
  Lucro_Percentual = paste0(lucro_perc, "%"),
  Participação = paste0(participacao, "%")
)

# Mostrar carteira
print(carteira, row.names = FALSE)

# Exportar
write.csv(carteira, file = "C:/Users/scaro/Desktop/IC/Data/carteira_10_acoes.csv", row.names = FALSE)
