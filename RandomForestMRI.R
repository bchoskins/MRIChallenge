# Random Forest Model

training_set = read.delim2('trainingData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
training_set[,2:124] <- as.data.frame(lapply(training_set[,2:124], as.numeric))
row.names(training_set) <- training_set$X
training_set <- training_set[,-1]

validation_set = read.delim2('validationData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
validation_set[,2:124] <- as.data.frame(lapply(validation_set[,2:124], as.numeric))
row.names(validation_set) <- validation_set$X
validation_set <- validation_set[,-1]


# Fitting Random Forest Regression to the dataset
library(randomForest)
set.seed(1234)
regressor = randomForest(residual_fluid_intelligence_score ~ ., data = training_set)

regressor
plot(regressor)
# Predicting a new result