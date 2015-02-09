# GettingAndCleaningData
Course Project for Getting and Cleaning Data
##The R script does the following:
1.Load the package dplyr
2.Download the compressed datasets
3.Decompress the datasets
4.Read in features
5.Read in activity lables
6.Read in test datasets, measurements (x), activity labels (y) and subjects
7.Read in training datasets, measurements (x), activity labels (y) and subjects
8.Combine activity labels, subjects and measurments in both test and trainning dataset
9.Merges the training and the test sets to create one data set.
10.Add descriptive variable names as column names
11.Uses descriptive activity names to replace the activity labels
12.Extracts only the measurements on the mean and standard deviation for each measurement
13.Data frame to data table
14.Group the data table by activity and subject, calculate the average of each variable, store the mean in a tidy data set
15.Write out the tidy dataset as a csv file
