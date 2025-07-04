# Criar um vetor de números
numeros <- c(10, 20, 15, 30, 25)

# Mostrar estatísticas básicas
summary(numeros)

# Criar um data frame simples
dados <- data.frame(
  nome = c("Ana", "Bruno", "Carlos", "Diana", "Eduardo"),
  idade = c(23, 31, 28, 22, 35)
)

# Ver o data frame
print(dados)

# Salvar como CSV na pasta atual
write.csv(dados, "C:/Users/scaro/Desktop/IC/Data/dados_teste2.csv", row.names = FALSE)

# Plotar gráfico
plot(dados$idade, type = "o", col = "blue", pch = 16,
     main = "Idade dos Participantes",
     xlab = "Pessoa", ylab = "Idade")

