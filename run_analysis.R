library(dplyr)
##Download the compressed datasets
url="https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zip_file<-"Dataset.zip"
download.file(url, zip_file, method="curl")
download.date<-date()
##Decompress the datasets
unzip(zip_file)
##Read in features
features<-read.table("./UCI HAR Dataset/features.txt", header=FALSE, stringsAsFactors=FALSE)
##Read in activity lables
activity_labels<-read.table("./UCI HAR Dataset/activity_labels.txt", header=FALSE, stringsAsFactors=FALSE)
##Read in test datasets, measurements (x), activity labels (y) and subjects
test.x<-read.table("./UCI HAR Dataset/test/X_test.txt", header=FALSE)
test.y<-read.table("./UCI HAR Dataset/test/Y_test.txt", header=FALSE)
test.subject<-read.table("./UCI HAR Dataset/test/subject_test.txt", header=FALSE)
##Read in training datasets, measurements (x), activity labels (y) and subjects
train.x<-read.table("./UCI HAR Dataset/train/X_train.txt", header=FALSE)
train.y<-read.table("./UCI HAR Dataset/train/Y_train.txt", header=FALSE)
train.subject<-read.table("./UCI HAR Dataset/train/subject_train.txt", header=FALSE)
##Combine activity labels, subjects and measurments in both test and trainning dataset
test<-cbind(test.y, test.subject, test.x)
train<-cbind(train.y, train.subject, train.x)
##Merges the training and the test sets to create one data set.
full<-rbind(test,train)
##Add descriptive variable names as column names
colnames(full)<-c("activity", "subject", features$V2)
##Uses descriptive activity names to replace the activity labels
full$activity[full$activity == 1]<-activity_labels[1,2]
full$activity[full$activity == 2]<-activity_labels[2,2]
full$activity[full$activity == 3]<-activity_labels[3,2]
full$activity[full$activity == 4]<-activity_labels[4,2]
full$activity[full$activity == 5]<-activity_labels[5,2]
full$activity[full$activity == 6]<-activity_labels[6,2]
##Extracts only the measurements on the mean and standard deviation for each measurement
col_activity<-full[,grepl("activity", colnames(full))]
col_subject<-full[,grepl("subject", colnames(full))]
mean<-full[,grepl("mean", colnames(full))]
std<-full[,grepl("std", colnames(full))]
dataset<-cbind(col_activity, col_subject, mean, std)
##Data frame to data table
tbl<-tbl_df(dataset)
##Group the data table by activity and subject, calculate the average of each variable,
##store the mean in a tidy data set
tidy_dataset<-tbl %>% group_by(col_activity, col_subject) %>% summarise_each(funs(mean))
##Write out the tidy dataset as a csv file
write.table(tidy_dataset, file="tidy_dataset.csv", sep=",", row.name=FALSE)