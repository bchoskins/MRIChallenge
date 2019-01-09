#Linear Model

df = read.delim2('trainingData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
df[,2:124] <- as.data.frame(lapply(df[,2:124], as.numeric))
row.names(df) <- df$X
df <- df[,-1]


linear_mod <- lm(residual_fluid_intelligence_score ~ ., data = df)
summary(linear_mod)



library(broom)
tidied <- tidy(linear_mod)
library(dplyr)
tidied <- arrange(tidied, p.value)


plot(predict(linear_mod), df$residual_fluid_intelligence_score,
     xlab="predicted", ylab="actual")
abline(a=0,b=1)

anova(linear_mod)

af <- anova(linear_mod)
afss <- af$"Sum Sq"
print(cbind(af, PctEx=afss/sum(afss)*100))

