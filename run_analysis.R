# Step1.
setwd("/Users/yannilboudo/Desktop/Coursera_Class/Getting_and_cleaning_data/UCI_HAR_Dataset")

if(!file.exists("data")) {dir.create("data")}

setwd("./train")

data_ytrain<- read.csv("y_train.txt", stringsAsFactors = FALSE)

data_Xtrain<-read.csv("X_train.txt", stringsAsFactors = FALSE, sep = "")
dim(data_Xtrain)

subjectTrain<-read.csv("subject_train.txt", stringsAsFactors = FALSE, sep ="")

setwd("./..")
setwd("./test")

data_Xtest<-read.csv("X_test.txt", stringsAsFactors = FALSE, sep ="")

data_ytest<- read.csv("y_test.txt", stringsAsFactors = FALSE)

subjectTest<-read.csv("subject_test.txt", stringsAsFactors = FALSE, sep ="")

#Merging
names(data_Xtrain) <- names(data_Xtest)
dataMerged<-rbind(data_Xtrain, data_Xtest)

names(data_ytest)<-names(data_ytrain)
labelMerge<-rbind(data_ytest, data_ytrain)

names(subjectTrain) <- names(subjectTest)
subjectMerge<- rbind(subjectTrain,subjectTest)

## Step2.
setwd("./..")

features <- read.table("features.txt")

measurements<- grep("mean\\(\\)|std\\(\\)",features[,2])

dataMerged <- dataMerged[,measurements] 

names(dataMerged) <- gsub("\\(\\)", "", features[measurements, 2])

names(dataMerged) <- gsub("mean", "Means", names(dataMerged))
names(dataMerged) <- gsub("std", "Std", names(dataMerged))
names(dataMerged) <- gsub("-", "", names(dataMerged))

## Step3.
activity<- read.csv("activity_labels.txt", stringsAsFactors = FALSE, sep = "", header = FALSE)
activity[,2]<-tolower(gsub("_","",activity[,2]))

activityLabels<-activity[labelMerge[,1],2]
labelMerge[,1]<-activityLabels
names(labelMerge)<-"activity"


# Step4.
names(subjectMerge)<-"subject"
fresh_data<-cbind(subjectMerge,labelMerge,dataMerged)
write.table(fresh_data, "data_Merged.txt")

# Step5.
subjectSize<-length(table(subjectMerge))
actSize<-dim(activity)[1]

library(dplyr)

d<-read.table("data_Merged.txt")

