#Linear Model

training_set = read.delim2('trainingData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
training_set[,2:124] <- as.data.frame(lapply(training_set[,2:124], as.numeric))
row.names(training_set) <- training_set$X
training_set <- training_set[,-1]

validation_set = read.delim2('validationData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
validation_set[,2:124] <- as.data.frame(lapply(validation_set[,2:124], as.numeric))
row.names(validation_set) <- validation_set$X
validation_set <- validation_set[,-1]

# Fitting Simple Linear Regression to the Training set
regressor = lm(formula = residual_fluid_intelligence_score ~ .,
               data = training_set)

summary(regressor)
anova(regressor)

#prediciton 
pred <- predict(regressor, validation_set)
head(pred)
head(validation_set)

library(Metrics)
rmse(validation_set$residual_fluid_intelligence_score, pred)













