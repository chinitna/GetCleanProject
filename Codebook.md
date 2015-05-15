# Codebook for GettingandCleaning.txt

File is space separated

Activity: 

Factor, 6 levels: describes the activity subject engaged in.

- LAYING
- SITTING
- STANDING
- WALKING
- WALKING\_DOWNSTAIRS
- WALKING\_UPSTAIRS

subject: 

Factor, 30 levels. Identifies the subject (person) that the measurements pertain to.

The other columns are variables, and are calculations from the accelerometer and gyroscopes in Samsung phones. See the features\_info.txt file for descriptions of these variables (given below as well). The GettingandCleaning.txt dataset has extracted only those variables that were measuring the mean or standard deviation of the variables, as described in features\_info.txt.

**In this dataset, the values in these columns are the means of each variable within each activity and subject from the original data.**

Many of these columns have a suffix -X, -Y, or -Z, because the data from the phones has movement data in three dimensions. 

## Information about the variables
*From features\_info.txt file included with original data available [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)*.

*Not my work, but they do a better job describing what the variables mean than I can*.
In addition, the only modifications I made to these variables was to take their means, so it is best to leave the description of the actual measurements to those who made the measurements in the first place.

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

> tBodyAcc-XYZ
> tGravityAcc-XYZ
> tBodyAccJerk-XYZ
> tBodyGyro-XYZ
> tBodyGyroJerk-XYZ
> tBodyAccMag
> tGravityAccMag
> tBodyAccJerkMag
> tBodyGyroMag
> tBodyGyroJerkMag
> fBodyAcc-XYZ
> fBodyAccJerk-XYZ
> fBodyGyro-XYZ
> fBodyAccMag
> fBodyAccJerkMag
> fBodyGyroMag
> fBodyGyroJerkMag