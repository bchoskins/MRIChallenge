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

m <- merge(data1, data2, by = 'subject', all =FALSE )

row.names(m) <- m$subject

m <- m[,-c(1, 3:9)]

write.csv(m, file = "MRIdata.csv")
