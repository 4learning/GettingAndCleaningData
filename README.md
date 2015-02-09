# GettingAndCleaningData
Course Project for Getting and Cleaning Data
##The R script does the following:
- Load the package dplyr
- Download the compressed datasets
- Decompress the datasets
- Read in features
- Read in activity lables
- Read in test datasets, measurements (x), activity labels (y) and subjects
- Read in training datasets, measurements (x), activity labels (y) and subjects
- Combine activity labels, subjects and measurments in both test and trainning dataset
- Merges the training and the test sets to create one data set.
- Add descriptive variable names as column names
- Uses descriptive activity names to replace the activity labels
- Extracts only the measurements on the mean and standard deviation for each measurement
- Data frame to data table
- Group the data table by activity and subject, calculate the average of each variable, store the mean in a tidy data set
- Write out the tidy dataset as a csv file
