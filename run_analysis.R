#This script performs the following operations on the UCI HAR Dataset

#1. Merges the training and the test sets to create one data set.
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
#3. Uses descriptive activity names to name the activities in the data set.
#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Set the path to the current working directory
current.directory <- getwd()

#Download the dataset from source if it doesn't exist in the current working directory
if(!file.exists("UCI HAR Dataset")){
    link <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(link, destfile = file.path(current.directory, "HAR.zip"), method = "curl")
    unzip(zipfile = "HAR.zip")
    invisible(file.remove("HAR.zip"))
}

#Store the path to the dataset directory for accessing required data
dataset.directory <- file.path(current.directory, "UCI HAR Dataset")

#Load all required packages
invisible(lapply(c("dplyr", "reshape2", "data.table", "tidyr", "qdap"), require, quietly = TRUE, character.only = TRUE))

#Loading the attributes of the dataset
features <- fread(file.path(dataset.directory, "features.txt"), col.names = c("Observation", "Feature"))

#Loading the activity information
activity <- fread(file.path(dataset.directory, "activity_labels.txt"), col.names = c("Observation", "Activity"))

#Loading the training data
Xtrain <- fread(file.path(dataset.directory, "train", "X_train.txt"), col.names = features$Feature)
Ytrain <- fread(file.path(dataset.directory, "train", "y_train.txt"), colClasses = "factor", col.names = "Activity")
subject.train <- fread(file.path(dataset.directory, "train", "subject_train.txt"), colClasses = "factor", col.names = "Subject")

#Loading the testing data
Xtest <- fread(file.path(dataset.directory, "test", "X_test.txt"), col.names = features$Feature)
Ytest <- fread(file.path(dataset.directory, "test", "y_test.txt"), colClasses = "factor", col.names = "Activity")
subject.test <- fread(file.path(dataset.directory, "test", "subject_test.txt"), colClasses = "factor", col.names = "Subject")

#1. Merging the train and test sets to form a data table
    
    #Merging the inputs (Xtrain and Xtest)
        X <- rbind(Xtrain, Xtest)
    #Merging the ground truth labels (Ytrain and Ytest)
        Y <- rbind(Ytrain, Ytest)
    #Merging subjects
        subjects <- rbind(subject.train, subject.test)
    #Merging the above data into one data table
        data <- cbind(subjects, Y, X)

#2. Extracting columns containing measurements on mean and standard deviation
        required.data <- data %>% select(Subject, Activity, grep("(mean|std)[()]", names(data)))

#3. Using descreptive activity names to name the activities in the data set
        levels(required.data$Activity) <- activity$Activity
        
        #Alternatives
            #required.data$Activity <-  sapply(required.data$Activity, function(observation) { activity[observation]$Activity })
            #required.data$Activity <-  activity[required.data$Activity, 2]

#4. Appropriately labelling the data set with descriptive variable names.
        rename.columns <- function(names){
             names <- multigsub(c("Acc", "Gyro", "Mag"), c("Accelerometer", "Gyrometer", "Magnitude"), names)
             names <- gsub("^t", "Time", names)
             names <- gsub("^f", "Frequency", names)
             names <- gsub("(Body){2}", "Body", names)
        }
        
        names(required.data) <- rename.columns(names(required.data))
        
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
        
        grouped.data <- required.data %>% group_by(Subject, Activity) %>% summarise_all(list(mean))
    
        write.table(grouped.data, file = file.path(current.directory,"tidydata.txt"), row.names = FALSE)
        
        #Alternatives
            # Method 1 - melting <- melt(required.data, id = c("Subject", "Activity"))
            #            grouped.data <- dcast(required.data, formula = Subject + Activity ~ variable, fun.aggregate = mean)
        
            # Method 2 (Using gather and spread) - required.data %>% gather(Feature, Value, -Subject, -Activity) %>% group_by_at(vars(-Value)) %>% summarise(Mean = mean(Value)) %>% spread(Feature, Mean)

