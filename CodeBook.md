## Code Book
The Human Activity Recognition Using Smartphones Dataset 

## Description of the UCI HAR Dataset 
*  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Download the UCI HAR Dataset   
*  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

## Attribute Information
For each record in the dataset it is provided: 

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.

## Transformations
* Load the feature names from the features.txt file. The entries will be the names for the columns in the training set.
* Load the training and testing files (X_train.txt and X_test.txt) and combine them in one data frame - training_set.
* Assign all the entries from the feature data set to the column name of the training_set. 
* Load the activity files as factors for training and testing (Y_train.txt and Y_test.txt) and combine them in one data frame - activity_set.
* Load the training and testing subject files (subject_train.txt and subject_test.txt) and combine them in one data frame - subject_set.
* Filter feature variables to those that have mean and standard deviation. There were 66 mean and std deviation variables.
* Reduce the number of columns in the training set to only those from the last step. The training set columns contain only the mean and std deviation data.
* Clean up the training set column names to be more descriptive. Rename and expand the column names.
* Combine the subject and activity data set with the training set.
* Replace the activity id in the combined training set with the activity names.
* Reshape the data. First, use melt to transpose the data set and use the 66 descriptive variables as the measurement.
* Second, use dcast to calculate the mean for all combinations of subject & activity.
* Output the results to an external file.

## Activity Variables
Factor variables with activity id and description 

1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

## Subject Variables  
Subject ID variable (1:30)

## Measurement Variables 
The mean and standard deviation variables (-1,1)  

*	Time BodyAcc Mean X-Axis
*	Time BodyAcc Mean Y-Axis
*	Time BodyAcc Mean Z-Axis
*	Time GravityAcc Mean X-Axis
*	Time GravityAcc Mean Y-Axis
*	Time GravityAcc Mean Z-Axis
*	Time BodyAccJerk Mean X-Axis
*	Time BodyAccJerk Mean Y-Axis
*	Time BodyAccJerk Mean Z-Axis
*	Time BodyGyro Mean X-Axis
*	Time BodyGyro Mean Y-Axis
*	Time BodyGyro Mean Z-Axis
*	Time BodyGyroJerk Mean X-Axis
*	Time BodyGyroJerk Mean Y-Axis
*	Time BodyGyroJerk Mean Z-Axis
*	Time BodyAccMag Mean
*	Time GravityAccMag Mean
*	Time BodyAccJerkMag Mean
*	Time BodyGyroMag Mean
*	Time BodyGyroJerkMag Mean
*	Frequency BodyAcc Mean X-Axis
*	Frequency BodyAcc Mean Y-Axis
*	Frequency BodyAcc Mean Z-Axis
*	Frequency BodyAccJerk Mean X-Axis
*	Frequency BodyAccJerk Mean Y-Axis
*	Frequency BodyAccJerk Mean Z-Axis
*	Frequency BodyGyro Mean X-Axis
*	Frequency BodyGyro Mean Y-Axis
*	Frequency BodyGyro Mean Z-Axis
*	Frequency BodyAccMag Mean
*	Frequency BodyBodyAccJerkMag Mean
*	Frequency BodyBodyGyroMag Mean
*	Frequency BodyBodyGyroJerkMag Mean
*	Time BodyAcc Std Dev X-Axis
*	Time BodyAcc Std Dev Y-Axis
*	Time BodyAcc Std Dev Z-Axis
*	Time GravityAcc Std Dev X-Axis
*	Time GravityAcc Std Dev Y-Axis
*	Time GravityAcc Std Dev Z-Axis
*	Time BodyAccJerk Std Dev X-Axis
*	Time BodyAccJerk Std Dev Y-Axis
*	Time BodyAccJerk Std Dev Z-Axis
*	Time BodyGyro Std Dev X-Axis
*	Time BodyGyro Std Dev Y-Axis
*	Time BodyGyro Std Dev Z-Axis
*	Time BodyGyroJerk Std Dev X-Axis
*	Time BodyGyroJerk Std Dev Y-Axis
*	Time BodyGyroJerk Std Dev Z-Axis
*	Time BodyAccMag Std Dev
*	Time GravityAccMag Std Dev
*	Time BodyAccJerkMag Std Dev
*	Time BodyGyroMag Std Dev
*	Time BodyGyroJerkMag Std Dev
*	Frequency BodyAcc Std Dev X-Axis
*	Frequency BodyAcc Std Dev Y-Axis
*	Frequency BodyAcc Std Dev Z-Axis
*	Frequency BodyAccJerk Std Dev X-Axis
*	Frequency BodyAccJerk Std Dev Y-Axis
*	Frequency BodyAccJerk Std Dev Z-Axis
*	Frequency BodyGyro Std Dev X-Axis
*	Frequency BodyGyro Std Dev Y-Axis
*	Frequency BodyGyro Std Dev Z-Axis
*	Frequency BodyAccMag Std Dev
*	Frequency BodyBodyAccJerkMag Std Dev
*	Frequency BodyBodyGyroMag Std Dev
*	Frequency BodyBodyGyroJerkMag Std Dev
	
## Tidy Data Set
The tidy data set has 30 subjects and 6 activites. This yields 180 observations of the average for each 
of the above measurement variables for each subject and activity combination 