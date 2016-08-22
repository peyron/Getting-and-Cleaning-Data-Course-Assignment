# Getting and Cleaning Data Course Project

This is the course project of the final week for the Getting and Cleaning Data course at Coursera. The ´run_analysis.R´-script does th follwing:

1. Reads data and merges data sets to a train and a test set based on the measurements on the mean and standard deviation for each measurement only
2. Merges train and test set
3. Keeps only the features that are mean or standard deviation for each measurement , while executing minor name fixes
4. Uses strings and measurement names to set the column names of the merged data set
5. Labels the activity factor feature
6. Reshapes and calculates the means of each feature and this creating a new tidy data set
7. Writes the new tidy data set to ´tidy_data.txt´
