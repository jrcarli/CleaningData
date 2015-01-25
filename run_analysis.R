## Author: Joe Carli
## Getting and Cleaning Data Course Project
## January 2015 

# This script uses ddply from plyr
# It also uses inner_join and arrange from dplyr
library(plyr)
library(dplyr)

name_field <- function(x) {
    ## This Function is a helper to clean up field names
    ### An input of tBodyAcc-mean()-X results in 
    ###     Avg_Mean_of_tBodyAcc_X
    ### An input of fBodyBodyAccJerkMag-std() results in 
    ###     Avg_StdDev_of_fBodyBodyAccJerkMag
    parts <- strsplit(x,"-")
    parts_len <- length(parts[[1]])
    # This if block should never happen but return full name if it does
    if(parts_len < 2) {
        return(x)
    }
    if(parts[[1]][2]=="mean()") {
        rtn_str <- paste("Avg_Mean_of_",parts[[1]][1],sep="")
    }
    else {
        rtn_str <- paste("Avg_StdDev_of_",parts[[1]][1],sep="")
    }
    if(parts_len==3) {
        rtn_str <- paste(rtn_str,"_",parts[[1]][3],sep="")
    }
    return(rtn_str)
}

# Save the current directory
origwd <- getwd()

# Set the working directory to the UCI HAR Dataset
setwd('UCI HAR Dataset')

# Read in features and name the columns
features <- read.table('features.txt',colClasses=c("integer","character"))
colnames(features) <- c("feature_col","feature_name")

# Identify the indeces for mean() and std() features
feature_mean_cols <- which(grepl("mean\\(\\)",features$feature_name))
feature_std_cols <- which(grepl("std\\(\\)",features$feature_name))

# Create a sorted list of column indeces for features to keep
feature_cols <- c(feature_mean_cols, feature_std_cols)
feature_cols <- sort(feature_cols)

# Read in the activity names and name the columns
activities <- read.table('activity_labels.txt',colClasses=c("integer","character"))
colnames(activities) <- c("activity_id","Activity")

# Build a list of column classes
# Note: "NULL" will tell read.table to skip a column
cc <- c()
for(i in 1:nrow(features)) {
    colclass <- "NULL"
    for(j in 1:length(feature_cols)) {
        if(feature_cols[j] == i) {
            colclass <- "numeric" 
            break
        }
    }
    cc <- c(cc,colclass)
}

# Read in the training and test data sets
train <- read.table('train/X_train.txt',colClasses=cc)
test <- read.table('test/X_test.txt',colClasses=cc)

# Read in the activity identifiers
train_lbls <- read.table('train/y_train.txt',colClasses=c("integer"))
test_lbls <- read.table('test/y_test.txt',colClasses=c("integer"))

# Read in the training subject identifiers 
# Note: using integer class rather than factor for numeric sorting
train_subjs <- read.table('train/subject_train.txt',colClasses=c("integer"))
test_subjs <- read.table('test/subject_test.txt',colClasses=c("integer"))

# Bind the activity labels and subject ids to the data frames
train <- cbind(train,train_lbls,train_subjs)
test <- cbind(test,test_lbls,test_subjs)

# Append the two to create one data frame 
df <- rbind(train,test)

# Set the columns to the actual feature names plus activity and subject id
colnames(df) <- c(features[feature_cols,2],"activity_id","subject_id")

# Give the activities actual labels 
df <- inner_join(df,activities,by="activity_id")

# Drop the numeric activity_id now that we have Activity (string)
df$activity_id <- NULL

# Calculate the mean of numeric features when grouped by subject and activity
avgs <- ddply(df, c("subject_id","Activity"), numcolwise(mean))

print(colnames(avgs))

# Let's make this nice by ordering by subject and activity id
avgs <- arrange(avgs,subject_id,Activity)

# Clean up the output column names
nice_colnames <- c("Subject","Activity",lapply(colnames(avgs)[3:68],name_field))
colnames(avgs) <- nice_colnames

# Print a bit of the data for sanity checking
print(avgs[1:10,1:5])

# Reset the working directory to where we started 
setwd(origwd)

# Finally output summarized data
write.table(avgs,'tidy_UCI_HAR_measurement_averages.txt',row.name=FALSE)
