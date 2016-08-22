# Getting and Cleaning Data Course Project

This is the course project of the final week for the Getting and Cleaning Data course at Coursera. The `run_analysis.R`-script does the following:

1. Reads data and merges data sets to a train and a test set based on the measurements on the mean and standard deviation for each measurement only
2. Merges train and test set
3. Keeps only the measurements that are mean or standard deviation for each measurement, while executing minor name fixes
4. Sets the column names and labels the activity variable
5. Reshapes and calculates the means of each measurement and thus creating a new tidy data set
6. Writes the new tidy data set to ´tidy_data.txt´
