GetCleanDataCourseProject
=========================

Project for Getting and Cleaning Data Course

This repo contains the following files: 

- This readme file "README.md"
- The Raw Data, stored in the folder "UCI HAR Dataset"
- The Tidy Data "means.txt"
- The codebook for the tidy data "CodeBook.md"
- The code that converted the raw data into the tidy data "run_analysis.R"

The "run_analysis.R" code is used to format the provided raw Samsung data and create a tidy dataset
containing the average values of provided features for the 30 volunteer subjects in the experiment, for 
each of 6 different activity types. It goes through the following steps: 
- Reads in all of the relevant raw data.
- Merges the provided training and test datasets to create a single data set.  
- Extracts only measurements related to the mean and standard deviation. 
- Formats the activity names from integer values 1-6 into human-readable descriptions (e.g. WALKING, LAYING). 
- Formats the column names on the dataset to be descriptive. 
- Summarises this dataset to provide the average of each feature by activity and test subject. 

The tidy data "means.txt" can be read into R using the following command: 
read.table("means.txt", header=TRUE)