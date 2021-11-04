
# Two-Way ANOVA ----------------------------------------------------------------------------------------------------------------------------

### O teste de ANOVA two way é usado para avaliar o efeito de dois grupos de variáveis
### independentes sobre uma variável dependente contínua.

### As variáveis independentes são conhecidas como fatores. As diferentes categorias
### dos grupos são chamadas de níveis. O número de níveis pode variar entre os grupos de
### variáveis independentes. 

# Pressupostos da ANOVA Two-Way ------------------------------------------------------------------------------------------------------------

### As observações dentro de cada nível dos grupos são normalmente distribuídas
### As variâncias das observações entre os grupos são iguais. 

# Carregando os dados ---------------------------------------------------------------------------------------------------------------------------

### Os dados usados serão do cojunto ToothGrowth construído para o dataset do R.
### O conjunto avalia o efeito da vitamina C sobre o crescimento dentário de porcos
### da índia (60 indivíduos). Cada animal recebe três doses de vitamina c (0.5, 1 e 2
### mg/dia). A vitamina são é representada por dois tipos: suco de laranja e ácido 
### ascórbico.

my_data <- ToothGrowth

# Observando a estrutura dos dados ---------------------------------------------------------------------------------------------------------

### Essa etapa é importante para avaliar se as variáveis são categóricas (factor) ou numéricas.

str(my_data)

### Como a variável dose está como numérica, para comparar os níveis é necessário
### transforma-la em variável categórica:

my_data$dose <- factor(my_data$dose, 
                  levels = c(0.5, 1, 2),
                  labels = c("D0.5", "D1", "D2"))
head(my_data)

# Visualizando os dados --------------------------------------------------------------------------------------------------------------------

library(ggpubr) # Esse pacote deve ser baixado para gerar o gráfico

ggboxplot(my_data, x = "dose", y = "len", color = "supp",
          palette = c("#00AFBB", "#E7B800")) # Cores para cada grupo de suplemento

### Gráfico com barras de erro e dispersão dos dados
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)

ggline(my_data, x = "dose", y = "len", color = "supp",
       add = c("mean_se", "dotplot"),
       palette = c("#00AFBB", "#E7B800"))

# Teste estatístico ------------------------------------------------------------------------------------------------------------------------

# Para realizar o teste usamos a função aov()
# Para verificar os resultados usamos a função summary()

res.aov2 <- aov(len ~ supp + dose, data = my_data)
summary(res.aov2)

# Para saber se existe interação entre as variáveis, usamos o "*"

res.aov3 <- aov(len ~ supp * dose, data = my_data)
summary(res.aov3)

# Interpretando os resultados da análise ---------------------------------------------------------------------------------------------------

# Considerando o valor de p < 0.05 para os dois grupos de variáveis supp e dose
# e também para a interação supp*dose, concluimos que tanto a dose como o tipo de
# vitamina e suas interações influenciam no crescimento dentário dos porcos da índia.

# Referência -------------------------------------------------------------------------------------------------------------------------------

### http://www.sthda.com/english/wiki/two-way-anova-test-in-r
