## The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 
## The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series
## of yes/no questions related to the project. You will be required to submit: 
##        1) a tidy data set as described below, 
##        2) a link to a Github repository with your script for performing the analysis, and 
##        3) a code book that describes the variables, the data, and any transformations or 
##           work that you performed to clean up the data called CodeBook.md. You should also 
##           include a README.md in the repo with your scripts. This repo explains how all of 
##           the scripts work and how they are connected. 
## 
## One of the most exciting areas in all of data science right now is wearable computing - see for example this article .
## Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users.
## The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S
## smartphone. A full description is available at the site where the data was obtained:
## 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## 
## Here are the data for the project:
## 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## 
##  You should create one R script called run_analysis.R that does the following. 
## 
##     Merges the training and the test sets to create one data set.
##     Extracts only the measurements on the mean and standard deviation for each measurement. 
##     Uses descriptive activity names to name the activities in the data set
##     Appropriately labels the data set with descriptive variable names. 
## 
##     From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
##     for each activity and each subject.
## 
## Data collected as of 2015/02/20
## As a preprocessing step, I removed the commas

## Read the raw data measurements for train and test
X_train_raw <- read.csv('train/X_train.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
X_test_raw <- read.csv('test/X_test.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
## Read the raw activity for train and test
Y_train_raw <- read.csv('train/Y_train.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
Y_test_raw <- read.csv('test/Y_test.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
## Read the raw subjects for train and test
subject_train_raw <- read.csv('train/subject_train.txt', header=FALSE, sep="", stringsAsFactors=FALSE)
subject_test_raw <- read.csv('test/subject_test.txt', header=FALSE, sep="", stringsAsFactors=FALSE)

## Read the variable indices and names
features_raw <- read.csv('features.txt', header=FALSE, sep="", col.names=c("Var_Idx", "Measurement"), stringsAsFactors=FALSE)

## Read the activity indices and names
activities_raw <- read.csv('activity_labels.txt', header=FALSE, sep=" ", col.names=c("Act_Idx", "Activity"), stringsAsFactors=FALSE)

## Select only the mean() and std() measurement indexes and names from the raw features
mean_std_rows <- as.vector(grep("mean()|std()", features_raw[,"Measurement"]))
features_mean_std <- features_raw[mean_std_rows,]
mean_std_cols <- features_mean_std[ , "Var_Idx"]

## Select only the mean() and std() measurements from the raw data frames using the vector of indexes from the prior step
X_train_mean_std <- X_train_raw[,mean_std_cols]
X_test_mean_std <- X_test_raw[,mean_std_cols]

## Add the mean() and std() measurement names to the train and test data frames of mean() and std() measurements
## using the vector of names from the earlier step
names(X_train_mean_std) <- features_mean_std[ , "Measurement"]
names(X_test_mean_std) <- features_mean_std[ , "Measurement"]

## Add the subject indexes to the train and test data frames of mean() and std() measurements
X_train_mean_std$SubjectIdx <- subject_train_raw[1, ]
X_test_mean_std$SubjectIdx <- subject_test_raw[1, ]

## Add the activity indexes to the train and test subject indexed mean() and std() data frames
X_train_mean_std$ActivityIdx <- Y_train_raw[1, ]
X_test_mean_std$ActivityIdx <- Y_test_raw[1, ]

## Add the activity names to the train/test subject and activity indexed mean() and std() data frames
X_train_mean_std$ActivityName <- apply(X_train_mean_std[, "ActivityIdx"], 1, function(x) { activities_raw[ activities_raw$Act_Idx==x, "Activity"] })
X_test_mean_std$ActivityName <- apply(X_test_mean_std[, "ActivityIdx"], 1, function(x) { activities_raw[ activities_raw$Act_Idx==x, "Activity"] })

## Set the row names so they will be unique 
rownames(X_train_mean_std) <- lapply(rownames(X_train_mean_std), function(x) { paste("train", x, sep = "") } )
rownames(X_test_mean_std) <- lapply(rownames(X_test_mean_std), function(x) { paste("test", x, sep = "") } )

## Merge the test and train data frames
Final_mean_std_data <- rbind(X_train_mean_std, X_test_mean_std)

## Write the intermediary file
write.csv(Final_mean_std_data, "Final_mean_std_data.csv")



