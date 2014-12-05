#fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileUrl, destfile = "Dataset.zip", method = "curl")

#unzip("Dataset.zip")

library(data.table)

dir <- "UCI HAR Dataset/"

activities <- read.table(paste(dir, "activity_labels.txt", sep=""), col.names = c("activityId", "activity"), sep=" ")

features <- read.table(paste(dir, "features.txt", sep=""), col.names = c("featureId", "feature"), sep=" ")
wantedFeatures <- features[grep("-(mean|std)\\(\\)", features$feature),]

# reset the data
data <- data.frame()

for (t in c("test")) { # , "train")) {
    # Read the data
    data_features <- read.table(paste(dir, t, "/X_", t, ".txt", sep=""), header = FALSE, sep = "", col.names = features$feature)
    # Only pull out the wanted features
    data_features <- data_features[,wantedFeatures$featureId]
    
    # Read the subjects
    data_subjects <- read.table(paste(dir, t, "/subject_",  t, ".txt", sep=""), col.names = c("subject"), header = FALSE)
    
    # Read the activities
    data_activities <- read.table(paste(dir, t, "/y_", t, ".txt", sep=""), col.names=c("activityId"), header = FALSE)
    # And turn into text
    data_activities <- merge(x=data_activities, y=activities, by="activityId")
    
    # And combine
    sampleData <- data_features
    sampleData$subject <- data_subjects$subject
    sampleData$activity <- data_activities$activity
    
    # Add this dataset to the full list of data
    data <- rbind(data, sampleData)
}

# Now product the reshaped data
library(reshape2)