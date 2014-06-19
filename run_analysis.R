options(stringsAsFactors=F)
setwd("I:/Coursera/Getting and Cleaning Data/getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset")
library(reshape2)
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
## only use col_std since it is smaller, derive relevant
##mean headings using replace(col_std, "std", "mean")?
trainX_std<-trainX_data[,col_std]
trainX_mean<-trainX_data[,col_mean]
testX_std<-testX_data[,col_std]
testX_mean<-testX_data[,col_mean]
## use cbind to combine both dataframes with subject and activity
## then merge on subject and activity
## should give dataframe with subject, activity, mean, and std columns

# col<-c(col_mean, col_std)
# testX_data<-testX_data[,col]
# trainX_data<-trainX_data[,col]
## maybe best to create vectors for subject, activity, mean, and std 
## and combine those with cbind
##combine train/test, subject, and activity using cbind
##test_df<-cbind(testX_data, sub_test, y_test)
##train_df<-cbind(trainX_data, sub_train, y_train)
test_df<-cbind(sub_test, y_test, testX_mean, testX_std)
train_df<-cbind(sub_train, y_train, trainX_mean, trainX_std)



## combine test and train dataframes using rbind
comb_df<-rbind(train_df, test_df)
if (any(is.na(comb_df))) {
    print("missing data")
}

filt_df<- data.frame()
tidy_df<- data.frame()
sub_act_df<-data.frame()
act_v<-activity$activity_name
sub_v<-1:30
for (act in act_v) {
    for (i in sub_v){
        filt<-comb_df[comb_df$activity_name==act & comb_df$subject==i,]
        filt_df<-rbind(filt_df, filt)
#         if (any(is.na(filt_df))) {
#             print(filt_df)
#         }
        means<- apply(filt_df[,3:81], 2, mean)
        if (!any(is.na(means))) {        
            tidy_df<-rbind(tidy_df, means)
        } else {
            print(c(i, act))
        }
        sub_act_df<-rbind(sub_act_df, list(i, act))
#         print(i)
#         print(act)
    }
}
return(filt_df)
# sub_act_df<-transform(sub_act_df, )
# colnames(tidy_df)<-names(comb_df)
# print(dim(tidy_df))
# for (i in sub_v){
#     sub_df<-comb_df[comb_df$subject==i,]
#     means<-apply(sub_df[,3:81], 2, mean)
#     subject_df<-rbind(tidy_df, means)
# }
# colnames(tidy_df)<-names(comb_df[,3:81])
# colnames(sub_act_df)<-c("subject", "activity")
# tidy_df<-cbind(sub_act_df, tidy_df)
# return(tidy_df)
# colnames(activity_df)<-names(comb_df[,3:81])
# colnames(subject_df)<-names(comb_df[,3:81])
# activity_df<-cbind(act_v, activity_df)
# subject_df<-cbind(sub_v, subject_df)
# tidy_df<-cbind(act_v, sub_v, tidy_df)
# print(dim(activity_df))
# print(dim(subject_df))
# feat_mean<-feat_data[col_mean]
# feat_std<-feat_data[col_std]
# props<-str_replace_all(feat_data[col_std], "std","")
# tidy_df<- data.frame()
# for (prop in props) {
#     
#     tidy_df<-rbind(temp_df)
#     
# }
# 
# splt_feat<-strsplit(feat_data[col_mean], split="-")
# 
# print(splt_feat[[1]][c(1,3)])
# nams<-names(comb_df)
## for (element in split_feat) {
## element<-element[!grepl("mean()", element)]
## pattern<- paste[element[1],"(.*), element[2], sep=""]
## sel_col<-grepl(pattern, nams)
## }
##melt_df<-melt(comb_df, c("subject", "activity_name"))
##check for missing data


##filt_df<-comb_df[,col]
##tidy<-melt(comb_df, c("subject", "activity"))
## str_replace(...)
# print(head(comb_df))