library(reshape2)

path <-"C:/coursera/Getting-and-Cleaning-Data/Course_Project"
data_folder <- ("UCI HAR Dataset") 
data_path <- paste(path,data_folder,sep="/")
train_path <- paste(data_path,"train",sep="/")
test_path <- paste(data_path,"test",sep="/")
zip_file <- ("getdata-projectfiles-UCI HAR Dataset.zip")
full_path_zip <- paste(path,zip_file,sep = "/")

# Set current working directory to top level folder
setwd(path)
  
# Determine if the zip exist in the top level folder
if(!file.exists(full_path_zip)) {
    #If Zip file does not exist, download file and store in the data sub folder
    url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
    download.file(url,destfile=zip_file)
    #extract to the data sub folder
    unzip(full_path_zip,overwrite=TRUE)
    
} else if(length(dir(data_folder)) == 0) {
    # Unzip the file if data subfolder is empty, 
    unzip(full_path_zip,overwrite=TRUE)
}

### Step 1 Load all files and combine the testing and training data ###
###    Merges the training and the test sets to create one data set.###
#######################################################################

## Load features files and rename the column names. 
features <- read.table(paste(data_path,"features.txt",sep="/"))
names(features) <- c("feature_id","feature_name")

## Load Training and Testing Files
x_training_set <- read.table(paste(train_path,"X_train.txt",sep="/"))
x_testing_set <-  read.table(paste(test_path,"X_test.txt",sep="/"))
## Combine Training and Testing Files
training_set <- rbind(x_training_set, x_testing_set)
### Name the training set columns with the entries in the features column
names(training_set) <- features$feature_name

## Load Training and Testing Activity Files as Factors
y_training_label <- read.table(paste(train_path,"y_train.txt",sep="/"), colClasses=c("factor"))
y_testing_label <-  read.table(paste(test_path,"y_test.txt",sep="/"), colClasses=c("factor"))
## Combine Training and Testing Files
activity_set <- rbind(y_training_label, y_testing_label)
## Rename the first column as the activity ID
names(activity_set) <-("activity_id")

## Load Activity Files
activity_label <- read.table(paste(data_path,"activity_labels.txt",sep="/"))
## Rename Activity columns 
names(activity_label) <- c("activity_id", "activity_name")

## Load the training and testing subject Files
subject_train <- read.table(paste(train_path,"subject_train.txt",sep="/"))
subject_test <-  read.table(paste(test_path,"subject_test.txt",sep="/"))
## Combine the Training and Testing subject files
subject_set <- rbind(subject_train, subject_test)
## Rename the first column
names(subject_set) <- ("subject_id")

### Step 2 We filter the data to display only the mean and standard deviation      ###
### Extracts only the measurements on the mean and standard deviation for each     ### 
### measurement. data. We also clean up the column names                           ###
######################################################################################

## Subset Columns
## Build filtered column index 
filtered_col <- grep("mean\\(\\)", features$feature_name)
filtered_col <- c(filtered_col, grep("std\\(\\)",features$feature_name))
## Build list of feature names with only mean and standard deviation
training_set <- training_set[,filtered_col]

## Clean up the Column Names
## Appropriately labels the data set with descriptive variable names.
col_names <- names(training_set)
col_names <- gsub("\\(\\)","",col_names)   #Remove"()" from the column names 
col_names <- gsub("-", " ", col_names)     #Replace "-" with " " from the column names 
col_names <- gsub("mean", "Mean", col_names)  #Uppercase M
col_names <- gsub("std", "Std Dev", col_names)  #Uppercase S
col_names <- gsub("X", "X-Axis", col_names)  #Addd "-Axis"
col_names <- gsub("Y", "Y-Axis", col_names)  #Addd "-Axis"
col_names <- gsub("Z", "Z-Axis", col_names)  #Addd "-Axis"
## Replace the "t" and "f" with "Time" and "Frequency" - descriptive variable names
col_names[substring(col_names,1,1)=="t"] <- paste("Time",substring(col_names[substring(col_names,1,1)=="t"],2),sep=" ")
col_names[substring(col_names,1,1)=="f"] <- paste("Frequency",substring(col_names[substring(col_names,1,1)=="f"],2),sep=" ")
## Update the column with new decriptive variable names
names(training_set) <- col_names
## Combine subject and training labels with training set
training_set <- cbind(subject_set,activity_set,training_set)

### Step 3 Add the activity labels and Reshape the data and calculate the mean ###
##################################################################################

## Replace the Acitivity ID with the Acitivity Description as Labels and Factors
## Uses descriptive activity names to name the activities in the data set.
training_set$activity_id <- factor(training_set$activity_id,levels=activity_label$activity_id, labels = activity_label$activity_name) 
## Change the name of the activity id column to activity 
colnames(training_set)[2] <- "activity"

## use the melt to transpose the data set
## uses the descriptive variables as the measurement
temp_data <- melt(training_set,id=c("subject_id","activity"))  
 
## reshape the temp_data and calculate the mean for all combinations of subject & activity 
mean_data <- dcast(temp_data, subject_id + activity ~ variable,mean)

##  Write the data set to an external file
##  Creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.
write.table(mean_data,file="mean_data_set.txt",row.name=FALSE)
