# Getting and Cleaning Data Course Project

The run_analysis.R performs the following
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Codebook.md 
The code book describes the variables, the data, and the transformations performed to clean up the data.

## getdata-projectfiles-UCI HAR Dataset.zip
This is the zip file that contains all the data sets.

## UCI HAR Dataset
This sub folder contains the data files ffrom the above zip file.

## mean_data_set.txt
Independent tidy data set with the average of each variable for each activity and each subject.

## run_analysis.R 
The R script will check if the zip data file is in the top level folder. If it is not in the
top level folder, it will download the file from here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

If the file exists but the UCI HAR Dataset sub folder is empty, the R script will unzip the file to
the UCI HAR Dataset sub folder. 

Step 1
The script will read the features, training, and testing data files.
The features data set contains the descriptive names of the columns in the training data set (V1, V2, etc).
The script will combine the testing and training tables to one data set and rename its column with the
entries from the features data set. The script will then read the activities training and testing files and convert 
them to factor variables. The script will combine the training and testing activities. 

The script will then load the testing, training subject files and the activity labels file. It will combine
the subject testing and training data sets into one subject data set. 

Step 2 
The script will build a list of indexes that contain only the name of measurements that contain the mean and 
standard deviation in their title. It will subset the columns of the training set to only those with mean() and
std() in their titles. the Training set now has 66 columns, down from 561. 

The script will then grab the column names from the training set and clean up their description. The
script will go through a series of find and replace steps using the gsub and substring functions to 
make the measurement titles more descriptive. After the cleaning, the script will replace the column names
in the training set with the new descriptive titles. The script will combine the subject and activity
dataset with the training data set.

Step 3 
The script will replace the activity id with the activity label. It will then melt the data using
the 66 descriptive variables as the measurement variables. It will then reshape the melted data and
calculate the average of each measurement variable for every activity and subject combination. 
Finally, the script will output to an external file called mean_data_set.txt.