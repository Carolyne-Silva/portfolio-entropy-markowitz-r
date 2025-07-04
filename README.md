# 📊 Investigando o Potencial da Entropia por Permutação como Ferramenta de Suporte à Teoria de Markowitz em R

Este projeto investiga se a **Entropia por Permutação (EP)** pode ser usada como ferramenta complementar à **Teoria de Markowitz**, enriquecendo a análise de risco em carteiras de investimento por meio de algoritmos implementados em **R**.

---

## 📌 Sobre o Projeto
Este repositório reúne dados, códigos, relatórios e documentação associados ao projeto de pesquisa sobre métricas alternativas de risco em portfólios.

---

## 🎯 Objetivos
- Desenvolver algoritmos em R para a Teoria Moderna de Portfólio e Entropia por Permutação.
- Aplicar ambos os métodos a carteiras compostas por ações brasileiras.
- Avaliar a integração dos métodos e sua complementaridade.

---

## 📁 Estrutura do Repositório
```
📦 Projeto
├── Data/         # Séries temporais (formato .csv)
├── Code/         # Scripts R com EP e Markowitz
├── Outputs/      # Resultados e gráficos gerados
├── Figures/      # Ilustrações e diagramas
├── Docs/         # Relatórios e documentação
├── Planning/     # Cronograma e canvas científico
└── README.md     # Este arquivo
```

---

## 🔬 Metodologia
- **Linguagem:** R
- **Pacotes principais:** `quantmod`, `PortfolioAnalytics`, `permentropy`
- **Dados:** Coletados com `quantmod` do Google Finance
- **Critérios:** Ações do mesmo setor (2022–2023), com histórico suficiente

---

## 🔎 Hipóteses
- **H₀:** A Entropia por Permutação não contribui significativamente na análise de risco.
- **H₁:** A EP enriquece a análise fornecendo complexidade adicional às métricas tradicionais.

---

## 📅 Cronograma
| Mês           | Atividades                                     |
|---------------|------------------------------------------------|
| Ago - Set     | Revisão bibliográfica                          |
| Out - Nov     | Implementação da Teoria de Markowitz           |
| Dez - Jan     | Implementação da Entropia por Permutação       |
| Fev - Abr     | Integração e análise dos resultados            |
| Mai - Jun     | Redação de artigos e relatório final           |
| Jul           | Finalização do projeto                         |

---

## 🔗 Links Importantes
- [Entropia por Permutação - Artigo de Bandt & Pompe](https://link.aps.org/doi/10.1103/PhysRevLett.88.174102)
- [Pacote quantmod](https://www.quantmod.com/)
- [Pacote permentropy (CRAN)](https://cran.r-project.org/package=permentropy)

---

## 👨‍💻 Equipe
- **Coordenação:** Seu Nome
- **Instituição:** Universidade / Grupo de Pesquisa
- **Contato:** email@exemplo.com

---

## ✅ Reprodutibilidade
Este projeto adota boas práticas para ciência reprodutível:
- [x] Código-fonte comentado
- [x] Dados abertos em formato `.csv`
- [x] Ferramentas FLOSS (R e pacotes livres)
- [x] Documentação clara e padronizada

---

> "Se a variância mede o quanto os retornos oscilam, a entropia mede o quanto o mercado se comporta de forma imprevisível. Juntas, revelam riscos visíveis e ocultos."
