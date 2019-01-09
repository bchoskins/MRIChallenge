#write validation data

data1 = read.delim2('validation_fluid_intelligenceV1.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
data2 = read.delim2('btsv02.txt')
data2 <- data2[-c(1),]

data2 <- data2[order(data2[, 'subjectkey']),]
data1 <- data1[order(data1[, 'subject']),]

names(data2)[names(data2) == 'subjectkey'] <- 'subject'

m <- merge(data1, data2, by = 'subject', all =FALSE )

#use subject id as row names 
row.names(m) <- m$subject

# get rid of useless columns
m <- m[,-c(1, 3:9, 132:134)]


write.csv(m, file = "validationData.csv")
