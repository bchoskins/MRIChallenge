# Random Forest Model

df = read.delim2('trainingData.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
df[,2:124] <- as.data.frame(lapply(df[,2:124], as.numeric))
row.names(df) <- df$X
df <- df[,-1]