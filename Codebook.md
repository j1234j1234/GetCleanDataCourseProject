GetCleanDataCourseProject - Codebook
=========================

The raw data was collected from the accelerometers of Samsung Galaxy S smartphones, and was obtained from this link: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data contains data for 561 features, for each of 30 volunteer subjects, for 6 different activities. 
The majority of the features have names such as "tBodyAcc-mean()-X", "fBodyAcc-skewness()-Z". These names can be split into 3 parts: 
- The first component relates to the type of the feature. For example, "tBody means "time Body" and "fBody" means "frequency Body". 
- The second component relates to a measurement of the feature. These measurements have the following definitions:   
mean(): Mean value  
std(): Standard deviation  
mad(): Median absolute deviation   
max(): Largest value in array  
min(): Smallest value in array  
sma(): Signal magnitude area  
energy(): Energy measure. Sum of the squares divided by the number of values.   
iqr(): Interquartile range   
entropy(): Signal entropy  
arCoeff(): Autorregresion coefficients with Burg order equal to 4  
correlation(): correlation coefficient between two signals  
maxInds(): index of the frequency component with largest magnitude  
meanFreq(): Weighted average of the frequency components to obtain a mean frequency  
skewness(): skewness of the frequency domain signal   
kurtosis(): kurtosis of the frequency domain signal   
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.  
angle(): Angle between to vectors.  
- The third component specifies whether the measurement is related to the X, Y or Z direction. 

Some additional features were provided by averaging signals, and have been specified with the angle() variable. 
All features have been normalised and bounded in the range [-1, 1].

This data had been split into a "train" and a "test" set, containing 70% and 30% of the data respectively. 
Data related to inertial signals was also provided, but it was not used in this piece of work. 

The data was transformed by following the steps below: 
1 Combine the train and test data into a single dataset.  
2 Only the features related to the mean and standard deviation were kept.  
3 The activities were labelled in the dataset. The raw activity values from integers from 1-6, but were converted into human-readable activity descriptions.   
4 The variables in the dataset were renamed. Abbreviations were expanded, brackets were removed from variable names and dashes were converted into periods.  
5 The data was summarised to obtain the mean of each of the features of interest, for each of the 30 volunteer subjects and the 6 activities performed.   

Codebook for the tidy data:  
Each row provides information for a given activity/subject combination. The first two columns (Activity and Subject) are identifier variables, and the remaining 66 columns are the mean of the feature specified by the column name.   
The subject is a unique identifier for each of the test volunteers, ranging from 1-50.   
The activity was transformed from a number (1-6) into a factor called Activity (with levels LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS and WALKING_UPSTAIRS)  
The remaining 66 columns are the means of the measurements on features of interest. The names are in the structure "1.2.3"
where 1 is the feature of interest, 2 is the measurement (either the mean or the standard deviation, shortened to std) and 3 is the X, Y or Z coordinate. All of these means have normalised values between -1 and +1. 