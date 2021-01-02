---
title: "README"
author: "Panagiota Siameti"
date: "02/01/2021"
output: html_document
---

#### Peer-graded Assignment: Getting and Cleaning Data Course Project

This repository has all the files necessary for the submission of the "Getting and Cleaning data" project on wearable computing.

**Dataset:** [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

`CodeBook.md`: this is a code book that describes the variables,the data, and any transformations or work performed to clean up the data 

`run_analysis.R`: this the code for downloading the data and performing the following steps required by the course's definition:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

`tidydata.txt`: this the final tidy data set, as described in step 5 above, exported in a text file.