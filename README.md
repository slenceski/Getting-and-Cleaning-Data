## Course 3 Getting and Cleaning Data Final Project

Included on this repo are

* This **README.md** file: explains the files available
* R Script **run_analysis.R** the code to download, process, and return a tidy data set
* **CodeBook.md** file offers more indepth information about the data and the variables in the final tidy data set
* **Tidy Data Set.txt** the output file from the run_analysis script.

The **run_analysis.R** script first contains the instructions given by Coursera for the project.

It gives the location of the original data and the location to download the data for the project

A full description is available at the site where the data was obtained:
 
  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
  
  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

It also gives the basic guideslines of what the script should do:

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each
measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.

From the README of the original data, some brief information about what the data set is in given.

##From there the start of my own code begins:

First there is opening the packages dplyr and tidyr - 
**the code assumes these packages have been installed previously**

The next part of the downloads the data into a file called "week4project.zip" *if the file already exists it will not redownload the data.*
The file unzips and opens the needed data for the project. *The sub-folders Inertial Signals are not used.*

As part of opening the data, each data set is labeled with the features info (as requested in part 4 of the project) in order to have a descriptive label.

Part 1 of the project is then completed, merging the testing and training data sets. A separate column, named Group identifies the original source each row of data.

*Note: plyr functionality is used to bind labels with data for both the test and train sets, as well as combine the two sets together.*

Part 3 of the project requirements is completed when by utilizing the cut function and creating a separate column for a descriptive activity rather than just Activity ID

In order to extract just the mean and std of the data, I used a grepl function for find all cases of mean or std. Then I removed the cases of MeanFreq from the vector.

The extraction vector created was appended with the beggining descriptor columns and used to subset the data to the desired data set for **part 2**, however all descriptions and labels are also correct at this time giving a the desired part 4 data set as well.

Finally, the script uses the tidyr package and the chaining operator to create a long and skinny data set, that has been grouped, and summarized (group remaining, but the code could be altered to remove Group from group_by)

The tidy data set is output to a text file, named "Tidy Data Set.txt"