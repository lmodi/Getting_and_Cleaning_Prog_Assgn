library(data.table)
library(reshape2)

## Loading the test data from the test folder
test_X <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
test_Y <- read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
test_sub <- read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

## Loading the train data from the train folder
train_X <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
train_Y <- read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
train_sub <- read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

## Loading the activity_labels data which contains description of each activity
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)

## Loading the features data which contains description of each column
features <- read.table("./UCI HAR Dataset/features.txt", header=FALSE)

## 3.Uses descriptive activity names to name the activities in the data set
## Replacing the activity id from the Y dataset with the activity name
test_Y$V1 <- factor(test_Y$V1,levels=activity_labels$V1,labels=activity_labels$V2)
train_Y$V1 <- factor(train_Y$V1,levels=activity_labels$V1,labels=activity_labels$V2)

## 4.Appropriately labels the data set with descriptive variable names. 
## Adding column description to each label
names(test_X) <- features$V2
names(train_X) <- features$V2
names(test_Y)<-c("Activity")
names(train_Y)<-c("Activity")
names(test_sub)<-c("Subject")
names(train_sub)<-c("Subject")

## 1.Merges the training and the test sets to create one data set.
test_Data<-cbind(test_X,test_Y,test_sub)
train_Data<-cbind(train_X,train_Y, train_sub)
Combined_Data<-rbind(test_Data,train_Data)

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 
cols <- grepl("mean\\(\\)",names(Combined_Data))|grepl("std\\(\\)", names(Combined_Data))
## Activity and Subject labels column also need to be included
cols[562] <- TRUE
cols[563] <- TRUE
Combined_Data <- Combined_Data[,cols]

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
melt_data <- melt(Combined_Data, id=c("Subject","Activity"))
tidy_data <- dcast(melt_data, Subject+Activity ~ variable, mean)

## Creating a txt file with the tidy data set
write.table(tidy_data, file = "./tidy_data.txt", row.names=FALSE)
