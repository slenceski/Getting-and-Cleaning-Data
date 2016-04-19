This is a Code Book that describes the variables, the data, and any transformations or work that you performed to clean up the data called.

This project is completed as an assignment for the Coursera Data Science Specialization. As given in the instructions for the assignment:

"The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

Reference:
[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

###Original Data
The original data contained multiple files for the 
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels 
* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
* Inertial Signals subfolders

The script here processes the original features vector into a single data frame combining the test and training data sets with their respective subject and activity labels.
The Inertial Signal subfolders are not used. After combining the data, the script then extracts each mean and standard deviation from the original feature vector. 
The data is then summarized by Group, Activity, and Subject and a separate data tidy set listing the average of each column (in some cases this is the average of the standard deviation) is produced.
This tidy data set is written to a text file as the output of the script.

In the tidy data set, the following columns are present:
Group: A descriptor listing the original group the data set was found in. Either test or train.
Activity: Uses the downloaded Activity Labels to replace the Activity ID with a descriptive value.
* 1 WALKING
* 2 WALKING_UPSTAIRS
* 3 WALKING_DOWNSTAIRS
* 4 SITTING
* 5 STANDING
* 6 LAYING

Subject_ID: a numerical identifier for the 30 volunteers the experiments were carried out on.
Variable: the means and standard deviations of the original features vector. see below for more detail. 
Mean: The mean of the variable list grouped by Group, Activity, and Subject_ID

The Variable Column contains the followin subset of the features vector. 
"Variable Name" (Full Variable Name and Additional Description) 
**NOTE on ALL UNITS Features are normalized and bounded within [-1,1]**

 [1] "1 tBodyAcc-mean()-X"  	(Mean of X-axial Acceleration; Body only signal; Time Domain Signal)                   
 [2] "2 tBodyAcc-mean()-Y"  	(Mean of Y-axial Acceleration; Body only signal;Time Domain Signal)                   
 [3] "3 tBodyAcc-mean()-Z"  	(Mean of Z-axial Acceleration; Body only signal; Time Domain Signal)                   
 [4] "4 tBodyAcc-std()-X"   	(Standard Deviation of X-axial Acceleration; Body only signal; Time Domain Signal)                   
 [5] "5 tBodyAcc-std()-Y"   	(Standard Deviation of Y-axial Acceleration; Body only signal; Time Domain Signal)                   
 [6] "6 tBodyAcc-std()-Z"       (Standard Deviation of Z-axial Acceleration; Body only signal; Time Domain Signal)               
 [7] "41 tGravityAcc-mean()-X"  (Mean of X-axial Acceleration; Gravity component signal; Time Domain Signal)
 [8] "42 tGravityAcc-mean()-Y"  (Mean of Y-axial Acceleration; Gravity component signal;Time Domain Signal)
 [9] "43 tGravityAcc-mean()-Z"  (Mean of Z-axial Acceleration; Gravity component signal;Time Domain Signal)
[10] "44 tGravityAcc-std()-X"   (Standard Deviation of X-axial Acceleration; Gravity component signal;Time Domain Signal)
[11] "45 tGravityAcc-std()-Y"   (Standard Deviation of Y-axial Acceleration; Gravity component signal;Time Domain Signal)
[12] "46 tGravityAcc-std()-Z"   (Standard Deviation of Z-axial Acceleration; Gravity component signal;Time Domain Signal)
[13] "81 tBodyAccJerk-mean()-X" (Mean of X-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[14] "82 tBodyAccJerk-mean()-Y" (Mean of Y-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[15] "83 tBodyAccJerk-mean()-Z" (Mean of Z-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[16] "84 tBodyAccJerk-std()-X"  (Standard Deviation of X-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[17] "85 tBodyAccJerk-std()-Y"  (Standard Deviation of Y-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[18] "86 tBodyAccJerk-std()-Z"  (Standard Deviation of Z-axial Body Acceleration Jerk Signal; Derived from body linear acceleration and angular velocity; Time Domain Signal)
[19] "121 tBodyGyro-mean()-X"   (Mean of X-axial Angular Velocity from body gyroscope; Time Domain Signal)
[20] "122 tBodyGyro-mean()-Y"   (Mean of Y-axial Angular Velocity from body gyroscope;Time Domain Signal)
[21] "123 tBodyGyro-mean()-Z"   (Mean of Z-axial Angular Velocity from body gyroscope;Time Domain Signal)
[22] "124 tBodyGyro-std()-X"    (Standard Deviation of X-axial Angular Velocity from body gyroscope;Time Domain Signal)
[23] "125 tBodyGyro-std()-Y"    (Standard Deviation of Y-axial Angular Velocity from body gyroscope;Time Domain Signal)
[24] "126 tBodyGyro-std()-Z"    (Standard Deviation of Z-axial Angular Velocity from body gyroscope;Time Domain Signal)
[25] "161 tBodyGyroJerk-mean()-X"(Mean of X-axial Gyroscope Jerk Signal; angular velocity derived in time; Time Domain Signal)
[26] "162 tBodyGyroJerk-mean()-Y"(Mean of Y-axial Gyroscope Jerk Signal; angular velocity derived in time;Time Domain Signal)
[27] "163 tBodyGyroJerk-mean()-Z"(Mean of Z-axial Gyroscope Jerk Signal; angular velocity derived in time;Time Domain Signal)
[28] "164 tBodyGyroJerk-std()-X" (Standard Deviation of X-axial Gyroscope Jerk Signal; angular velocity derived in time;Time Domain Signal)
[29] "165 tBodyGyroJerk-std()-Y" (Standard Deviation of Y-axial Gyroscope Jerk Signal; angular velocity derived in time;Time Domain Signal)
[30] "166 tBodyGyroJerk-std()-Z" (Standard Deviation of Z-axial Gyroscope Jerk Signal; angular velocity derived in time;Time Domain Signal)
[31] "201 tBodyAccMag-mean()"    (Mean of Magnitude of Body Acceleration Euclidean Norm; Time Domain Signal)
[32] "202 tBodyAccMag-std()"     (Standard Deviation of Magnitude of Body Acceleration Euclidean Norm;Time Domain Signal)
[33] "214 tGravityAccMag-mean()" (Mean of Magnitude of Gravity Acceleration Euclidean Norm ; Time Domain Signal)
[34] "215 tGravityAccMag-std()"  (Standard Deviation of Magnitude of Gravity Acceleration Euclidean Norm; Time Domain Signal)
[35] "227 tBodyAccJerkMag-mean()"(Mean of Magnitude of Acceleration Jerk Signal Euclidean Norm; Time Domain Signal)
[36] "228 tBodyAccJerkMag-std()" (Standard Deviation of Magnitude of Acceleration Jerk Signal Euclidean Norm; Time Domain Signal)
[37] "240 tBodyGyroMag-mean()"   (Mean of Magnitude Angular Velocity from body gyroscope; Euclidean Norm; Time Domain Signal)
[38] "241 tBodyGyroMag-std()"    (Standard Deviation of Magnitude Angular Velocity from body gyroscope; Euclidean Norm;Time Domain Signal)
[39] "253 tBodyGyroJerkMag-mean()"(Mean of Magnitude of Gyroscope Jerk Signal Euclidean Norm; Time Domain Signal)
[40] "254 tBodyGyroJerkMag-std()" (Standard Deviation of Magnitude of Gyroscope Jerk Signal Euclidean Norm; Time Domain Signal)
[41] "266 fBodyAcc-mean()-X"     (Mean of FFT of Body Acceleration - X axial component)       
[42] "267 fBodyAcc-mean()-Y"     (Mean of FFT of Body Acceleration - Y axial component)              
[43] "268 fBodyAcc-mean()-Z"     (Mean of FFT of Body Acceleration - Z axial component)              
[44] "269 fBodyAcc-std()-X"      (Standard Deviation of FFT of Body Acceleration - X axial component)             
[45] "270 fBodyAcc-std()-Y"      (Standard Deviation of FFT of Body Acceleration - Y axial component)               
[46] "271 fBodyAcc-std()-Z"      (Standard Deviation of FFT of Body Acceleration - Z axial component)
[47] "345 fBodyAccJerk-mean()-X" (Mean of FFT of Body Acceleration Jerk Signal- X axial component)
[48] "346 fBodyAccJerk-mean()-Y" (Mean of FFT of Body Acceleration Jerk Signal- Y axial component)
[49] "347 fBodyAccJerk-mean()-Z" (Mean of FFT of Body Acceleration Jerk Signal- Z axial component)
[50] "348 fBodyAccJerk-std()-X"  (Standard Deviation of FFT of Body Acceleration Jerk Signal- X axial component)
[51] "349 fBodyAccJerk-std()-Y"  (Standard Deviation of FFT of Body Acceleration Jerk Signal- Y axial component)
[52] "350 fBodyAccJerk-std()-Z"  (Standard Deviation of FFT of Body Acceleration Jerk Signal- Z axial component) 
[53] "424 fBodyGyro-mean()-X"    (Mean of X-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[54] "425 fBodyGyro-mean()-Y"    (Mean of Y-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[55] "426 fBodyGyro-mean()-Z"    (Mean of Z-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[56] "427 fBodyGyro-std()-X"     (Standard Deviation of X-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[57] "428 fBodyGyro-std()-Y"	 (Standard Deviation of Y-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[58] "429 fBodyGyro-std()-Z"	 (Standard Deviation of Z-axial Angular Velocity from body gyroscope; Fast Fourier Transformation)
[59] "503 fBodyAccMag-mean()"    	(Mean of Magnitude of Body Acceleration Euclidean Norm; Fast Fourier Transformation)
[60] "504 fBodyAccMag-std()"		(Standard Deviation of Magnitude of Body Acceleration Euclidean Norm; Fast Fourier Transformation)
[61] "516 fBodyBodyAccJerkMag-mean()"	(Mean of Magnitude of Acceleration Jerk Signal Euclidean Norm; Fast Fourier Transformation)
[62] "517 fBodyBodyAccJerkMag-std()"	(Standard Deviation of Magnitude of Acceleration Jerk Signal Euclidean Norm; Fast Fourier Transformation)
[63] "529 fBodyBodyGyroMag-mean()"	(Mean of Magnitude Angular Velocity from body gyroscope; Euclidean Norm; Fast Fourier Transformation)
[64] "530 fBodyBodyGyroMag-std()"	(Standard Deviation of Magnitude Angular Velocity from body gyroscope; Euclidean Norm; Fast Fourier Transformation)
[65] "542 fBodyBodyGyroJerkMag-mean()"  (Mean of Magnitude of Gyroscope Jerk Signal Euclidean Norm; Fast Fourier Transformation)
[66] "543 fBodyBodyGyroJerkMag-std()"   (Standard Deviation of Magnitude of Gyroscope Jerk Signal Euclidean Norm; Fast Fourier Transformation)
