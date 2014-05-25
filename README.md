Getting and Cleaning Data Course Project
=========================

The purpose of this project is to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data for the project called Samsung data is availible from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
The project includes the following files
-------------------------
- *README.md*
- *CodeBook.md*: code book that describes the variables, the data, and transformations.
- *run_analysis.R*: R script that prepare tidy data 
- *tidydataset.txt*: tidy data set produced by R script

Samsung data
--------------------------
R script called run_analysis.R uses the following files from Samsung data:
- *features.txt*: List of all features.
- *activity_labels.txt*: Links the class labels with their activity name.
- *train/X_train.txt*: Training set.
- *train/y_train.txt*: Training labels.
- *test/X_test.txt*: Test set.
- *test/y_test.txt*: Test labels.
- *train/subject_train.txt*: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.
- *test/subject_test.txt*: Each row identifies the subject who performed 
   the activity for each window sample.
   
R script called run_analysis.R does the following:
-------------------------
1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement. 
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive activity names. 
1. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Notes: 
--------------------------
Before run R script run_analysis.R  please be ensure that  Samsung data is in working directory or set working directory to Samsung data location.

License:
--------------------------
Roman A. Lukerin May, 2014



