---
title: "CodeBook"
author: "Panagiota Siameti"
date: "02/01/2021"
output: html_document
---
The `run_analysis.R` script prepares tidy data according to the "Getting and Cleaning Data Course Project" instructions.

## Data used

The Data used for the project were downloaded inside the URI HAR Dataset and are the following:   

- `features.txt`: The features that were measured. 
- `activity_labels.txt`: The list of activities performed by subjects when the features were measured and their codes 
- `test/subject_test.txt`: Each row identifies the  test subject who performed the activity. Its range is from 1 to 30 
- `test/X_test.txt`: measured features data for the test subjects 
- `test/y_test.tx`t: activity codes for the test subjects
- `train/subject_train.txt`: Each row identifies the  no-test subject who performed the activity. Its range is from 1 to 30
- `train/X_train.txt`: measured features data for the no-test subjects
- `train/y_train.txt`: activity codes for the no-test subjects

## Steps to tidy the data

### 1.Read the data into tables

- `features_list`<-`features.txt`: 61 rows, 2 columns
- `activity_labels`<-`activity_labels.txt`: 6 rows, 2 columns
- `Subject_test`<-`subject_test.txt`:2947 rows, 1 column 
- `activityset_test` <-`X_test.txt`:2947 rows, 561 columns
- `activityclass_test`<-t`est/y_test.txt:`2947 rows,1 column
- `Subject_train` <- `subject_train.txt`:7352 rows, 1 column
- `activityset_train` <-`train/X_train.txt`:7352 rows, 561 columns
- `activityclass_train` <-`y_train.txt`:7352 rows, 1 columns

### 2.Merge the training and test sets and name the merged tables

- `subject` (10299 rows, 1 column) is created by merging `Subject_test` and `Subject_train` using rbind()
- `activity` (10299 rows, 1 column) is created by merging `activityclass_test` and `activityclass_train` using rbind()
- `activity_set` (10299 rows, 561 columns) is created by merging `activityset_test` and `activityset_train` using rbind() and by naming teh columns using the names included in features_list$V2

### 3.Get the full data set

- `dataset`  (10299 rows, 563 column) is created by merging `Subject,activity and activity_se``t` using cbind()

### 4.Extract only the measurements on the mean and standard deviation for each measurement

- `datasubset`(10299 rows, 88 columns) is created by subsetting dataset by selecting only -columns:`Subject,activity` and the measurements on the on the `mean` and `standard deviation` (std).

### 5.Use descriptive activity names to name the activities in the data set

- The `activity` column of the `datasubset` is factorised and labeled by the second column of the `activity_label` table

### 6.Appropriately labels the data set with descriptive variable names

- All start with character `t` in column’s name replaced by `time`
- All start with character `f` in column’s name replaced by `frequency`
- All `Acc` in column’s name replaced by `Accelerometer`
- All `Gyro` in column’s name replaced by `Gyroscope`
- All `BodyBody` in column’s name replaced by `Body`
- All `Mag` in column’s name replaced by `Magnitude`

### 7.Create an independent tidy data set with the average of each variable for each activity and each subject

- `Data` (180 rows, 88 columns) is created by aggregating `datasubset` taking the mean of each variable for each `activity` and each `subject`
- Export `Data` into `tidydata.txt` file






