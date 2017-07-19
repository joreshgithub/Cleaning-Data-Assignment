#run_analysis.R
library(data.table)
library(dplyr)

#Convert all files to data frames
dfal <- read.table("activity_labels.txt")
dff <- read.table("features.txt")

dfstest <- read.table("subject_test.txt")
dfxtest <- read.table("X_test.txt")
dfytest <- read.table("Y_test.txt")

dfstrain <- read.table("subject_train.txt")
dfxtrain <- read.table("X_train.txt")
dfytrain <- read.table("Y_train.txt")


#Part 1 : Merges the training and the test sets to create one data set.
# Combine all test dataframes
dftest <- cbind(dfstest, dfxtest, dfytest)

#Combine all train data frames
dftrain <- cbind(dfstrain, dfxtrain, dfytrain)

#Combine test and train into one data frame
df <- rbind(dftest, dftrain)

#Part 4: Appropriately labels the data set with descriptive variable names.
#Change column names of consolidated data frame df
names(df)[1] <- c("Subject")
dfflist <- dff[,2]
dfflist <- as.character(dfflist)
names(df)[2:562] <- dfflist
names(df)[563] <- c("Activity_Labels")

#Part 3: Uses descriptive activity names to name the activities in the data set
df$Activity_Labels <- as.character(df$Activity_Labels)
df[df$Activity_Labels == 1,"Activity_Labels"] <- c("WALKING")
df[df$Activity_Labels == 2,"Activity_Labels"] <- c("WALKING_UPSTAIRS")
df[df$Activity_Labels == 3,"Activity_Labels"] <- c("WALKING_DOWNSTAIRS")
df[df$Activity_Labels == 4,"Activity_Labels"] <- c("SITTING")
df[df$Activity_Labels == 5,"Activity_Labels"] <- c("STANDING")
df[df$Activity_Labels == 6,"Activity_Labels"] <- c("LAYING")

#Part 2: Extracts only the measurements on the mean and standard deviation for each measurement.
#subset all columns for mean and sd
colnames <- names(df)
namesmean <- grep("mean", colnames, value=TRUE)
namesstd <- grep("std", colnames, value=TRUE)
names <- c("Subject")
names <- append(names, namesmean)
names <- append(names, namesstd)
names <- append(names, "Activity_Labels")
dfsub <- subset(df, select = names)

#Part 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#create table of averages
  
library(data.table)
grouping <- group_by(dfsub, Subject, Activity_Labels)

#Change column names to avoid duplication
#for (i in 2:80) {
#  names(grouping)[i] <- paste(names(grouping)[i],"-",i, sep="")
#

#Calculate means of each combination
summary <- summarize_all(grouping, funs(mean))


