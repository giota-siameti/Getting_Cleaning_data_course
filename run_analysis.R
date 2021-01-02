##download and unzip the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
unzip(zipfile="./data/Dataset.zip",exdir="./data")
##read data from the files
path<-file.path("./data" , "UCI HAR Dataset")
activityclass_test <-read.table(file.path(path, "test" , "Y_test.txt" ),header = FALSE)
activityclass_train <- read.table(file.path(path, "train", "Y_train.txt"),header = FALSE)
activityset_test  <- read.table(file.path(path, "test" , "X_test.txt" ),header = FALSE)
activityset_train <- read.table(file.path(path, "train", "X_train.txt"),header = FALSE)
Subject_train <- read.table(file.path(path, "train", "subject_train.txt"),header = FALSE)
Subject_test <- read.table(file.path(path, "test" , "subject_test.txt"),header = FALSE)
features_list<-read.table(file.path(path, "features.txt"),head=FALSE)
activity_labels<-read.table(file.path(path, "activity_labels.txt"),header = FALSE)
##merge training and test data by row
activity_class<-rbind(activityclass_test,activityclass_train)
activity_set<-rbind(activityset_test,activityset_train)
subject<-rbind(Subject_train,Subject_test)
##naming the variables
names(subject)<-c("subject")
names(activity_class)<-c("activity")
names(activity_set)<-features_list$V2
## merging data by column to get the full data set
dataset<-cbind(subject,activity_class,activity_set)
## defining the names of the measurements on the mean and standard deviation
measurements_names<-features_list$V2[grep("mean\\(\\)|std\\(\\)",features_list$V2)]
## extracting the measurements on the mean and standard deviation
datasubset<-subset(dataset,select=c("subject","activity",as.character(measurements_names)))
##Use descriptive activity names to name the activities in the data set
datasubset$activity<-factor(datasubset$activity,labels=activity_labels[,2])
##Appropriately labels the data set with descriptive variable names
names(datasubset)<-gsub("^t", "time", names(datasubset))
names(datasubset)<-gsub("^f", "frequency", names(datasubset))
names(datasubset)<-gsub("Acc", "Accelerometer", names(datasubset))
names(datasubset)<-gsub("Gyro", "Gyroscope", names(datasubset))
names(datasubset)<-gsub("Mag", "Magnitude", names(datasubset))
names(datasubset)<-gsub("BodyBody", "Body", names(datasubset))
##create an independent tidy data set
library(plyr);
Data<-aggregate(. ~subject + activity, datasubset, mean)
write.table(Data, file = "tidydata.txt",row.name=FALSE)

