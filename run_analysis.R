## First step 
# Read data sets and merge them
# Directory esercizio

library(data.table)
library(dplyr)

setwd("R/esercizio")

labelsTest <- read.table("test/y_test.txt", col.names="label", header = FALSE)
subjectsTest <- read.table("test/subject_test.txt", col.names="subject", header = FALSE)
dataTest <- read.table("test/X_test.txt", header = FALSE)
labelsTrain <- read.table("train/y_train.txt", col.names="label", header = FALSE)
subjectsTrain <- read.table("train/subject_train.txt", col.names="subject", header = FALSE)
dataTrain <- read.table("train/X_train.txt", header = FALSE)
featuresName <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

subject <- rbind(subjectsTrain, subjectsTest)
activity <- rbind(labelsTrain, labelsTest)
features <- rbind(dataTrain, dataTest)

colnames(features) <- t(featuresName[2])

colnames(activity) <- "Activity"
colnames(subject) <- "Subject"
datiglobali <- cbind(features,activity,subject)

## Second step 
# Extract only mean and standard deviation

columnsMeanandSTD <- grep(".*Mean.*|.*Std.*", names(datiglobali), ignore.case=TRUE)
requiredColumns <- c(columnsMeanandSTD, 562, 563)
estratto <- datiglobali[,requiredColumns]

## Third step 
# Descriptive activity names to activities in data set

estratto$Activity <- as.character(estratto$Activity)
for (i in 1:6){
     estratto$Activity[estratto$Activity == i] <- as.character(activities[i,2])
}
estratto$Activity <- as.factor(estratto$Activity)

## Fourth step 
# Label data set with descriptive variable names

names(estratto)<-gsub("^t", "Time", names(estratto))
names(estratto)<-gsub("^f", "Frequency", names(estratto))
names(estratto)<-gsub("-mean()", "Mean", names(estratto), ignore.case = TRUE)
names(estratto)<-gsub("-std()", "STD", names(estratto), ignore.case = TRUE)
names(estratto)<-gsub("-freq()", "Frequency", names(estratto), ignore.case = TRUE)
names(estratto)<-gsub("Acc", "Acceleration", names(estratto))
names(estratto)<-gsub("Gyro", "Rotation", names(estratto))
names(estratto)<-gsub("Mag", "Value", names(estratto))
names(estratto)<-gsub("tBody", "TimeBody", names(estratto))
names(estratto)<-gsub("angle", "Angle", names(estratto))
names(estratto)<-gsub("gravity", "Gravity", names(estratto))
names(estratto)<-gsub("BodyBody", "Body", names(estratto))

## Fifth step 
# From data in step 4, create another independent tidy data set with average
# for each variable for each activity and each subject

estratto$Subject <- as.factor(estratto$Subject)
estratto <- data.table(estratto)

datiaggregati <- aggregate(. ~Subject + Activity, estratto, mean)
datiaggregati <- datiaggregati[order(datiaggregati$Subject,datiaggregati$Activity),]
write.table(datiaggregati, file = "tidy2.txt", row.names = FALSE, col.names = FALSE)

