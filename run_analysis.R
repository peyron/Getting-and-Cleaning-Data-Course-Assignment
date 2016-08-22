## Read data and merge columns

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")

features <- read.table("UCI HAR Dataset/features.txt") 

featuresKeep <- grep(".*mean.*|.*std.*", features[,2]) ## Note: meanfreq features will also be included, either way is correct as instructions easily could be interprested differently

trainX <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresKeep]
trainLabels <- read.table("UCI HAR Dataset/train/y_train.txt")
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubject, trainLabels, trainX)

testX <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresKeep]
testLabels <- read.table("UCI HAR Dataset/test/y_test.txt")
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubject, testLabels, testX)

# Merge rows, keep only columns which include mean and std,
# set column names and label activites

merged <- rbind(train,test)

featuresKeepNames <- features[featuresKeep,2]
featuresKeepNames <- gsub("-", "", featuresKeepNames)
featuresKeepNames <- gsub("mean", "Mean", featuresKeepNames)
featuresKeepNames <- gsub("std", "Std", featuresKeepNames)
featuresKeepNames <- gsub("\\()", "", featuresKeepNames)
featuresKeepNames

colnames(merged) <- c("Subject_ID", "Activity", as.vector(featuresKeepNames))
colnames(merged)


merged$Activity <- factor(merged$Activity,
                    levels = activityLabels[,1],
                    labels = activityLabels[,2])

## Create tidy data set with the average of each variable for each subject and activity

require(reshape2)
mergedMolten<- melt(merged, id = c("Subject_ID", "Activity")) 
mergedMean <- dcast(mergedMolten, Subject_ID + Activity ~ variable, mean)

## Write new tidy data to text file

write.table(mergedMean, "Getting-and-Cleaning-Data-Course-Assignment/tidy_data.txt", row.names = FALSE)

