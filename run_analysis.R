# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation 
#    for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 
# 5. Creates a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 

library(reshape)
# Load list of all Features labels
FeatureLabels<-read.table("features.txt", col.names=c("id", "Feature"))

#Load list of Activity labels and their id
ActivityLabels<-read.table("activity_labels.txt", col.names=c("id", "Activity"))

#Load list of  Activity labels id for training set
TrainingActivities<-read.table("train/y_train.txt", col.names="id")

#Load list of  Activity labels id for training set
TestActivities<-read.table("test/y_test.txt", col.names="id")

#Load Training data set and names column using data from Feature labels
TrainingSet<-read.table("train/X_train.txt", 
                        col.names=gsub("(\\()|(\\())","",FeatureLabels$Feature))
#Load Test data set and names column using data from Feature labels
TestSet<-read.table("test/X_test.txt", 
                    col.names=gsub("(\\()|(\\())","",FeatureLabels$Feature))
#Load Subjects for Training data set
TrainingSubjects<-read.table("train/subject_train.txt", col.names="id")

#Load Subjects for Test data set
TestSubjects<-read.table("test/subject_test.txt", col.names="id")

#Extracts from Feature labels only the labels on the mean ( consists mean () ) 
#and standard deviation (consists std ())
meansdCols<-grepl("(mean\\(\\))|(std)",as.character(FeatureLabels$Feature))

#Create new data set by merging Training and Test data set
TTSet<-rbind(TrainingSet, TestSet)

#Extracts only the measurements on the mean and standard deviation for each measurement
TTSet<-TTSet[,meansdCols]

#Merge Training and Test  Activities id data set
TTActivities<-rbind(TrainingActivities, TestActivities)

#Create new variable and name it using conjunction of Activities id from 
#Training and Test set with Activity labels id.
TTSet$ActivityName<-merge(TTActivities, 
                          ActivityLabels, by="id", all.x= TRUE, sort=FALSE)$Activity
# Add Subject column to Training and Test set
TTSet$Subject<-factor(rbind(TrainingSubjects, TestSubjects)$id)

#Melt Trainig and Test set by "Subject" and ActivityName and name it TidySet 
TidySet<-melt(TTSet, id.vars=c("Subject", "ActivityName"))

#Calculate the average of each variable for each activity and each subject
TidySet<-cast(TidySet, Subject+ActivityName~variable, mean,add.missing=TRUE)

#Write tidy data to file
write.table(TidySet,"tidydataset.txt")