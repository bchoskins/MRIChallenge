#MRI Data

#write new organized dataframe

data1 = read.delim2('training_fluid_intelligenceV1.csv', header = TRUE, sep = ",", dec = ",", stringsAsFactors = FALSE)
data2 = read.delim2('btsv01.txt')
data2 <- data2[-c(1),]


data2 <- data2[order(data2[, 'subjectkey']),]
data1 <- data1[order(data1[, 'subject']),]

#done to compare subjectkey with src_subject_id
data2$src_subject_id<-toupper(data2$src_subject_id)

names(data2)[names(data2) == 'subjectkey'] <- 'subject'

# 3 observations from the training_fluid_intelligenceV1 are not in the btsv01 containing all values
m <- merge(data1, data2, by = 'subject', all =FALSE )

#use subject id as row names 
row.names(m) <- m$subject

# get rid of useless columns
m <- m[,-c(1, 3:9, 132:134)]

# m <- lapply(m, as.numeric)
write.csv(m, file = "MRIdata.csv")
