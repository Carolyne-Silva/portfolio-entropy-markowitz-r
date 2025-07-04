# Simular retornos diários de dois ativos
set.seed(123)
ativo1 <- rnorm(250, mean = 0.0005, sd = 0.01)
ativo2 <- rnorm(250, mean = 0.0008, sd = 0.012)

# Combinar em uma carteira com pesos iguais
retorno_portfolio <- 0.5 * ativo1 + 0.5 * ativo2

# Calcular métricas simples
ret_medio <- mean(retorno_portfolio)
volatilidade <- sd(retorno_portfolio)
sharpe <- ret_medio / volatilidade

# Definir local de saída
caminho_saida <- "C:/Users/scaro/Desktop/IC/Outputs/Results/resultado_simples.txt"

# Gerar arquivo de saída
writeLines(c(
  "RESULTADOS DA CARTEIRA SIMULADA",
  "==================================",
  sprintf("Retorno médio diário: %.5f", ret_medio),
  sprintf("Volatilidade (DP): %.5f", volatilidade),
  sprintf("Índice de Sharpe (simplificado): %.5f", sharpe)
), con = caminho_saida)

cat("Arquivo gerado em:", caminho_saida, "\n")
