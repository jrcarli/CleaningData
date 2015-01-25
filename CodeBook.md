# Code Book for Getting and Cleaning Data Course Project

This document describes the original data set used for the course project, and the resulting tidy data set. It also describes how to download the original data), and how to execute [run_analysis.R](run_analysis.R) to create the tidy data set.

##### Table of Contents:

* [Original Data Set](#Original Data Set)
* [Tidy Data Set](#Tidy Data Set)
* [Creating the Tidy Data Set](#Creating the Tidy Data Set)
* [Script Actions](#Script Actions)

## Original Data Set
The original data set for this course proejct was downloaded from here: 
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

### Explanation of Original Data
An explanation for the original data set may be found here:
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

The original data includes 561 features, which are measurements of various smartphone sensor data. The measurements were taken from 30 subjects in six different forms of activity:

* Lying down
* Sitting
* Standing
* Walking
* Walking down stairs
* Walking up stairs

Of these 561 features, 33 were averages and 33 were standard deviations calcluated from the measurements. These 66 calculated measurement features were used for the summarized, tidy data set.


## Tidy Data Set
The [tidy data set](tidy_UCI_HAR_measurement_averages.txt) is a summarized version of both the training and test sets from the original data.

### Tidy Data Set Columns
The tidy data set contains 68 columns:

* Subject
* Activity
* Avg_Mean_of_tBodyAcc_X
* Avg_Mean_of_tBodyAcc_Y
* Avg_Mean_of_tBodyAcc_Z
* Avg_StdDev_of_tBodyAcc_X
* Avg_StdDev_of_tBodyAcc_Y
* Avg_StdDev_of_tBodyAcc_Z
* Avg_Mean_of_tGravityAcc_X
* Avg_Mean_of_tGravityAcc_Y
* Avg_Mean_of_tGravityAcc_Z
* Avg_StdDev_of_tGravityAcc_X
* Avg_StdDev_of_tGravityAcc_Y
* Avg_StdDev_of_tGravityAcc_Z
* Avg_Mean_of_tBodyAccJerk_X
* Avg_Mean_of_tBodyAccJerk_Y
* Avg_Mean_of_tBodyAccJerk_Z
* Avg_StdDev_of_tBodyAccJerk_X
* Avg_StdDev_of_tBodyAccJerk_Y
* Avg_StdDev_of_tBodyAccJerk_Z
* Avg_Mean_of_tBodyGyro_X
* Avg_Mean_of_tBodyGyro_Y
* Avg_Mean_of_tBodyGyro_Z
* Avg_StdDev_of_tBodyGyro_X
* Avg_StdDev_of_tBodyGyro_Y
* Avg_StdDev_of_tBodyGyro_Z
* Avg_Mean_of_tBodyGyroJerk_X
* Avg_Mean_of_tBodyGyroJerk_Y
* Avg_Mean_of_tBodyGyroJerk_Z
* Avg_StdDev_of_tBodyGyroJerk_X
* Avg_StdDev_of_tBodyGyroJerk_Y
* Avg_StdDev_of_tBodyGyroJerk_Z
* Avg_Mean_of_tBodyAccMag
* Avg_StdDev_of_tBodyAccMag
* Avg_Mean_of_tGravityAccMag
* Avg_StdDev_of_tGravityAccMag
* Avg_Mean_of_tBodyAccJerkMag
* Avg_StdDev_of_tBodyAccJerkMag
* Avg_Mean_of_tBodyGyroMag
* Avg_StdDev_of_tBodyGyroMag
* Avg_Mean_of_tBodyGyroJerkMag
* Avg_StdDev_of_tBodyGyroJerkMag
* Avg_Mean_of_fBodyAcc_X
* Avg_Mean_of_fBodyAcc_Y
* Avg_Mean_of_fBodyAcc_Z
* Avg_StdDev_of_fBodyAcc_X
* Avg_StdDev_of_fBodyAcc_Y
* Avg_StdDev_of_fBodyAcc_Z
* Avg_Mean_of_fBodyAccJerk_X
* Avg_Mean_of_fBodyAccJerk_Y
* Avg_Mean_of_fBodyAccJerk_Z
* Avg_StdDev_of_fBodyAccJerk_X
* Avg_StdDev_of_fBodyAccJerk_Y
* Avg_StdDev_of_fBodyAccJerk_Z
* Avg_Mean_of_fBodyGyro_X
* Avg_Mean_of_fBodyGyro_Y
* Avg_Mean_of_fBodyGyro_Z
* Avg_StdDev_of_fBodyGyro_X
* Avg_StdDev_of_fBodyGyro_Y
* Avg_StdDev_of_fBodyGyro_Z
* Avg_Mean_of_fBodyAccMag
* Avg_StdDev_of_fBodyAccMag
* Avg_Mean_of_fBodyBodyAccJerkMag
* Avg_StdDev_of_fBodyBodyAccJerkMag
* Avg_Mean_of_fBodyBodyGyroMag
* Avg_StdDev_of_fBodyBodyGyroMag
* Avg_Mean_of_fBodyBodyGyroJerkMag
* Avg_StdDev_of_fBodyBodyGyroJerkMag

#### Subject
Subjects are identified as integers 1-30.

### Activity
Six different forms of activity are present for each subject and are identified with the following labels:

* LAYING
* SITTING
* STANDING
* WALKING
* WALKING_DOWNSTAIRS
* WALKING_UPSTAIRS

#### Remaining Columns
The other 66 columns represent averages from the original data when grouped by Subject and Activity. Of the 561 original features, 66 were either calculated averages or standard devations. These features were named *measurement*-**mean()** and *measurement*-**std()**, respectively.

Once the original training and test data sets were combined and grouped by Subject and Activity, these 66 calculated features were averaged to create the data found in the [tidy data set](tidy_UCI_HAR_measurement_averages.txt).

See the [original data set documentation](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) for more information. 

## Creating the Tidy Data Set

### Download the Original Data
Download the original data set from here:

[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

For instance:

	$ curl --insecure https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip > uci_har.zip	

### Unzip the Original Data
Unzip the downloaded file. For instance:

	$ unzip uci_har.zip
	
The zip file may be deleted (optional) after this step.

### Execute the Analysis R Script

#### Required Packages
The [run_analysis.R](run_analysis.R) script requires two additional packages:

* plyr
* dplyr

Install these packages with the following commands from the R prompt:

	install.packages("plyr")
	install.packages("dplyr")
	
#### Working Directory Assumptions
It is assumed that a directory called "UCI HAR Dataset" exists alongside run_analysis.r. This should be the directory created by unzipping the original data set. The R script will work on data found within this directory, but it will produce a text file (tidy_UCI_HAR_measurement_averages.txt) in the same directory as run_analysis.r (the script will not modify the contents of "UCI HAR Dataset"). This is the assumed setup:

	$ ls
	UCI HAR Dataset			run_analysis.R
	
#### Executing the Script
You may run the script with the following command:

	$ r -f run_analysis.R
	
#### After Execution
The tidy data set will be in the same directory once execution completes:

	$ ls
	UCI HAR Dataset			run_analysis.R			tidy_UCI_HAR_measurement_averages.txt
	
## Script Actions
The following provides a high-level overview of the script's actions.

1. Load required `plyr` and `dplyr` packages
* Save the current working directory
* Change into the UCI HAR Dataset directory
* Read in the feature names (features.txt)
* Determine which are *mean()* or *std()* features
* Use ``read.table``, passing only the required columns, to bring in the training and test data
* Read in the labels for both the training and test data (indicating which activity is being measured) (train/y_train.txt or test/y_test.txt)
* Read in the subject identifiers (train/subject_train.txt or test/subject_test.txt)
* Create training and test data frames that contain all the data, activity labels, and subject identifiers
* Combine the training and test data frames into a single data frame
* Group the data by subject and activity and compute the column means for the 66 features
* Clean up the column labels
* Print a snippet of the results
* Write the results to tidy_UCI_HAR_measurement_averages.txt using `write.table`

