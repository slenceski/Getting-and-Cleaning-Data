##2016-04-11
##Coursera Class 3 Getting and Cleaning Data
##Week 4 Project
#
#
##Instructions for project:
#
#The data linked to from the course website represent data collected from the 
#accelerometers from the Samsung Galaxy S smartphone. 
#A full description is available at the site where the data was obtained:
# 
#  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#
#Here are the data for the project:
#  
#  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#
#You should create one R script called run_analysis.R that does the following.
#
#1)Merges the training and the test sets to create one data set.
#2)Extracts only the measurements on the mean and standard deviation for each
#measurement.
#3)Uses descriptive activity names to name the activities in the data set
#4)Appropriately labels the data set with descriptive variable names.
#5)From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.
#
##  ======================================
#From the README in data download:
#For each record it is provided:
#  
#- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
#- Triaxial Angular velocity from the gyroscope. 
#- A 561-feature vector with time and frequency domain variables. 
#- Its activity label. 
#- An identifier of the subject who carried out the experiment.
#
#  ======================================
###Start of my code run_analysis.R
#
library(dplyr)
library(tidyr)

#Download Data
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
if (!file.exists("week4project.zip")) {
download.file(url,destfile = "week4project.zip")
} else print("File already downloaded")

#open data

#/UCI HAR Dataset
unzip("week4project.zip", exdir = "week4projectunzip")
activity_labels <- readLines("week4projectunzip/UCI HAR Dataset/activity_labels.txt")
#features_info <- readLines("week4projectunzip/UCI HAR Dataset/features_info.txt")
features <- readLines("week4projectunzip/UCI HAR Dataset/features.txt")

#/test
subject_test <- read.table("week4projectunzip/UCI HAR Dataset/test/subject_test.txt")
x_test <- read.table("week4projectunzip/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("week4projectunzip/UCI HAR Dataset/test/Y_test.txt")
#Part 4) Label Data Set
colnames(x_test) <- features
colnames(y_test) <- "Activity_ID"
colnames(subject_test) <- "Subject_ID"
xy_test <- bind_cols(y_test, subject_test, x_test)

#/train
subject_train <- read.table("week4projectunzip/UCI HAR Dataset/train/subject_train.txt")
x_train <- read.table("week4projectunzip/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("week4projectunzip/UCI HAR Dataset/train/y_train.txt")
#Part 4) Label Data Set
colnames(x_train) <- features
colnames(y_train) <- "Activity_ID"
colnames(subject_train) <- "Subject_ID"
xy_train <- bind_cols(y_train, subject_train, x_train)

#Part 1) Merge Data
alldata <- bind_rows(list(test = xy_test,train = xy_train), .id = "Group")

#Part 3)Uses descriptive activity names to name the activities in the data set
activitylabelvect <- as.data.frame(cut(alldata$Activity_ID, breaks = 6, labels = activity_labels))
colnames(activitylabelvect) <- "Activity"
alldata2 <- bind_cols(activitylabelvect, alldata)

#2)Extracts the mean and standard deviation for each measurement.
extractlogical <- grepl("-mean()|-std()", features, ignore.case = TRUE)
notextractlogical <- grepl("-meanFreq()", features)
extractvect <- xor(extractlogical,notextractlogical)
extractvect2 <- features[extractvect]
extractvect2 <- append(colnames(alldata2[1:4]), extractvect2)
part4dataset <- alldata2[ , extractvect2]

#Part 5)From the data set in step 4, creates a second, independent tidy data set 
#with the average of each variable for each activity and each subject.

tidydata <- gather(part4dataset, "Variable", "Value", 5:70) %>% group_by(Group, Activity, Subject_ID, Variable) %>% summarise(Mean = mean(Value))
if (!file.exists("Tidy Data Set.txt")) {
  write.table(tidydata, file = "Tidy Data Set.txt", row.names = FALSE)
} else print("Tidy Data Set file already exists")

