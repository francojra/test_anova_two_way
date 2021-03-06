
# Two-Way ANOVA ----------------------------------------------------------------------------------------------------------------------------

### O teste de ANOVA two way � usado para avaliar o efeito de dois grupos de vari�veis
### independentes sobre uma vari�vel dependente cont�nua.

### As vari�veis independentes s�o conhecidas como fatores. As diferentes categorias
### dos grupos s�o chamadas de n�veis. O n�mero de n�veis pode variar entre os grupos de
### vari�veis independentes. 

# Pressupostos da ANOVA Two-Way ------------------------------------------------------------------------------------------------------------

### As observa��es dentro de cada n�vel dos grupos s�o normalmente distribu�das
### As vari�ncias das observa��es entre os grupos s�o iguais. 

# Carregando os dados ---------------------------------------------------------------------------------------------------------------------------

### Os dados usados ser�o do cojunto ToothGrowth constru�do para o dataset do R.
### O conjunto avalia o efeito da vitamina C sobre o crescimento dent�rio de porcos
### da �ndia (60 indiv�duos). Cada animal recebe tr�s doses de vitamina c (0.5, 1 e 2
### mg/dia). A vitamina s�o � representada por dois tipos: suco de laranja e �cido 
### asc�rbico.

my_data <- ToothGrowth

# Observando a estrutura dos dados ---------------------------------------------------------------------------------------------------------

### Essa etapa � importante para avaliar se as vari�veis s�o categ�ricas (factor) ou num�ricas.

str(my_data)

### Como a vari�vel dose est� como num�rica, para comparar os n�veis � necess�rio
### transforma-la em vari�vel categ�rica:

my_data$dose <- factor(my_data$dose, 
                  levels = c(0.5, 1, 2),
                  labels = c("D0.5", "D1", "D2"))
head(my_data)

# Visualizando os dados --------------------------------------------------------------------------------------------------------------------

library(ggpubr) # Esse pacote deve ser baixado para gerar o gr�fico

ggboxplot(my_data, x = "dose", y = "len", color = "supp",
          palette = c("#00AFBB", "#E7B800")) # Cores para cada grupo de suplemento

### Gr�fico com barras de erro e dispers�o dos dados
# Add error bars: mean_se
# (other values include: mean_sd, mean_ci, median_iqr, ....)

ggline(my_data, x = "dose", y = "len", color = "supp",
       add = c("mean_se", "dotplot"),
       palette = c("#00AFBB", "#E7B800"))

# Teste estat�stico ------------------------------------------------------------------------------------------------------------------------

# Para realizar o teste usamos a fun��o aov()
# Para verificar os resultados usamos a fun��o summary()

res.aov2 <- aov(len ~ supp + dose, data = my_data)
summary(res.aov2)

# Para saber se existe intera��o entre as vari�veis, usamos o "*"

res.aov3 <- aov(len ~ supp * dose, data = my_data)
summary(res.aov3)

# Interpretando os resultados da an�lise ---------------------------------------------------------------------------------------------------

# Considerando o valor de p < 0.05 para os dois grupos de vari�veis supp e dose
# e tamb�m para a intera��o supp*dose, concluimos que tanto a dose como o tipo de
# vitamina e suas intera��es influenciam no crescimento dent�rio dos porcos da �ndia.

# Refer�ncia -------------------------------------------------------------------------------------------------------------------------------

### http://www.sthda.com/english/wiki/two-way-anova-test-in-r
