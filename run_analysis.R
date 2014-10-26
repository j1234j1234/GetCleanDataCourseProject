#################################################################################
# The run_analysis.R code is used to format the provided Samsung data
# and create a tidy dataset containing the average values of provided features
# for each subject in the experiment, and for each activity type. 
#################################################################################

#0. First read in all the data
#It is assumed that the work directory has already been set using the setwd() function.

Train.X <- read.table("./UCI HAR Dataset/train/X_train.txt",header = FALSE)
Train.Y <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
Train.Subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

Test.X <- read.table("./UCI HAR Dataset/test/X_test.txt",header = FALSE)
Test.Y <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
Test.Subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

Activity.Labels <- read.table("./UCI HAR Dataset/activity_labels.txt",header = FALSE)
Features <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

#1. Merge the training and the test sets to create one data set using the rbind function.
All.X <- rbind(Train.X, Test.X)
All.Y <- rbind(Train.Y, Test.Y)
All.Subject <- rbind(Train.Subject, Test.Subject)

#2. Extract only the measurements on the mean and standard deviation for each measurement. 
#I have assumed that only variables that contain "mean()" or "std()" in their name are required to be kept. 
#There are variables such as "fBodyBodyGyroMag-meanFreq()" in the data which have not been kept. 
#The reason is that the "Mean Frequency" is a different measure from the mean, as per the features_info.txt
#file included with the data. 
#In addition, I have not imported the data from the "inertial" folder, as these do not contain any 
#means or standard deviations. 

Mean.or.Std <- (grepl("mean\\(\\)", Features[,2]) | grepl("std\\(\\)", Features[,2]))
Small.X <- All.X[, Mean.or.Std]
All.Data <- cbind(All.Subject, All.Y, Small.X)

#3. Use descriptive activity names to name the activities in the data set
#This has been achieved using the values from the "activity_labels" text file provided. 

colnames(All.Data)[1] <- "Subject"
colnames(All.Data)[2] <- "Activity"
as.factor(All.Data$Activity)

All.Data$Activity[All.Data$Activity==1] <- toString(Activity.Labels[1, 2])
All.Data$Activity[All.Data$Activity==2] <- toString(Activity.Labels[2, 2])
All.Data$Activity[All.Data$Activity==3] <- toString(Activity.Labels[3, 2])
All.Data$Activity[All.Data$Activity==4] <- toString(Activity.Labels[4, 2])
All.Data$Activity[All.Data$Activity==5] <- toString(Activity.Labels[5, 2])
All.Data$Activity[All.Data$Activity==6] <- toString(Activity.Labels[6, 2])

#4. Appropriately label the data set with descriptive variable names. 
#This has been achieved using the "features" text file provided.
#The variable names provided have been modified in the following way: 
# - dashes were converted to periods
# - any brackets were removed 
# - "tBody" was expanded to read "timeBody"
# - "tGravity" was expanded to read "timeGravity"
# - "fBody" was expanded to read "frequencyBody"
# - "Acc" was expanded to read "Acceleration"

Small.Features <- Features[ Mean.or.Std,2]

Small.Features <- gsub("-", ".", Small.Features)
Small.Features <- gsub("\\(", "", Small.Features)
Small.Features <- gsub("\\)", "", Small.Features)
Small.Features <- gsub("tBody", "timeBody", Small.Features)
Small.Features <- gsub("tGravity", "timeGravity", Small.Features)
Small.Features <- gsub("fBody", "frequencyBody", Small.Features)
Small.Features <- gsub("Acc", "Acceleration", Small.Features)

colnames(All.Data) <- c("Subject","Activity", Small.Features )

#5. Create an independent tidy data set with the average of each variable for each activity and each subject.
Means <- aggregate(All.Data[,3:ncol(All.Data)], by = list(All.Data$Activity, All.Data$Subject ), FUN="mean")
colnames(Means)[1:2] <- c("Activity", "Subject")

write.table(Means, "means.txt",row.name=FALSE)

#test <- read.table("means.txt", header=TRUE)

colnames(Means)
