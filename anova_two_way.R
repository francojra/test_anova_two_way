
# Two-Way ANOVA ----------------------------------------------------------------------------------------------------------------------------

### O teste de ANOVA two way é usado para avaliar o efeito de dois grupos de variáveis
### independentes sobre uma variável dependente contínua.

### As variáveis independentes são conhecidas como fatores. As diferentes categorias
### dos grupos são chamadas de níveis. O número de níveis pode variar entre os grupos de
### variáveis independentes. 

# Pressupostos da ANOVA Two-Way ------------------------------------------------------------------------------------------------------------

### As observações dentro de cada nível dos grupos são normalmente distribuídas
### As variâncias das observações entre os grupos são iguais. 

# Carregar dados ---------------------------------------------------------------------------------------------------------------------------

### Os dados usados serão do cojunto ToothGrowth construído para o dataset do R.
### O conjunto avalia o efeito da vitamina C sobre o crescimento dentário de porcos
### da índia (60 indivíduos). Cada animal recebe três doses de vitamina c (0.5, 1 e 2
### mg/dia). A vitamina são é representada por dois tipos: suco de laranja e ácido 
### ascórbico.

my_data <- ToothGrowth

# Observando a estrutura dos dados ---------------------------------------------------------------------------------------------------------

### Essa etapa é importante para avaliar se as variáveis são categóricas (factor) ou numéricas.

str(my_data)
