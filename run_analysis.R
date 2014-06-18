setwd("I:/Coursera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
library(reshape2)
## load data into data frames
feat_data<-read.table("features.txt", colClasses="character")
feat_data<-feat_data[,2]
activity<-read.table("activity_labels.txt", 
                     col.names=c("activity", "activity_name"), 
                     colClasses="character")

testX_data<-read.table("test\\X_test.txt", colClasses="numeric",
                      col.names=feat_data)
trainX_data<-read.table("train\\X_train.txt", colClasses="numeric",
                       col.names=feat_data)

sub_test<-read.table("test\\subject_test.txt", 
                     col.names="subject", colClasses="character")
sub_train<-read.table("train\\subject_train.txt", 
                      col.names="subject", colClasses="character")

y_test<-read.table("test\\y_test.txt",
                   col.names="activity")
y_test<-merge(y_test, activity, by.x=1, by.y=1)
y_test$activity<-NULL
y_train<-read.table("train\\y_train.txt",
                    col.names="activity")
y_train<-merge(y_train, activity, by.x=1, by.y=1)
y_train$activity<-NULL

## filter for mean and std

col_mean<-grep("mean", feat_data)
col_std<-grep("std", feat_data)

trainX_std<-trainX_data[,col_std]
trainX_mean<-trainX_data[,col_mean]
testX_std<-testX_data[,col_std]
testX_mean<-testX_data[,col_mean]

## combine the train and test data frames with subject and activity

test_df<-cbind(sub_test, y_test, testX_mean, testX_std)
train_df<-cbind(sub_train, y_train, trainX_mean, trainX_std)

## combine test and train dataframes using rbind
comb_df<-rbind(train_df, test_df)

## test for missing data

if (any(is.na(comb_df))) {
    print("missing data")
}
