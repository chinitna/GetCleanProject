# ReadMe for Data Scientist's Toolbox Project

This repo contains the following files:

* ReadMe.md - describes how the script run\_analysis.R works
* run\_analysis.R - the R script
* Codebook.md - describes the dataset GettingandCleaning.txt
* GettingandCleaning.txt - the tidy dataset produced by run_analysis.R

This file describes how the run_analysis.R script works.


This script assumes that the [data](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) has been downloaded and unzipped to yield a folder "UCI HAR Dataset" in the working directory. 

This script uses functions from the dplyr library

I do not exactly follow the step sequence given in the assignment, because I think it makes things clearer to do some of the labeling immediately, as it needs to be done anyway, and reduces the chances of mistakes later to have labeled variables. I will note with *emphasis* the step numbers as described in the assignment.

The flow of the script is as follows

1. Read in the following files: 
  * subject\_test.txt, subject\_train.txt - code for which subject each row of data belongs to
  * y\_test.txt, y\_train.txt - codes for the activity of each row
  * X\_test.txt, X\_train.txt - the actual data, one row for each measurement, columns are variables as described originally in features\_info.txt 
  * features.txt - the measurements calculated by the original researchers. These will be the column headers for X
  * activity_labels.txt - maps the activity codes in y to the names of the activities in english

2. This is *Step 4, give descriptive variable names*. Replace the "V#" column headers in X\_test and X\_train with the descriptive variable names given in features. I do this simply by assigning the 'names' of X to the names contained in features

3. This is *Step 1, merge the training and test data*. 
  1. for each of test and train, combine the activity codes (y), the subjects, and the data itself (X) using 'cbind()'
  2. stack the training and test data together using 'rbind()'

4. This is *Step 2, extract only the measurements of means and standard deviations*. I interpreted this directive to mean to use all variables that are a caclulated mean or standard deviation of something. Thus, I did a 'grep()' on the names for "mean()" and "std()" to get the indices of columns that are calculated means and standard deviations. I then cut the dataset to include only those columns and the columns identifying subjects and activities. This yields 79 variables that were either measures of means or standard deviations.

5. This is *Step 3, give descriptive activity names*. Here, I replaced the activity codes with the english names for those codes using the translations provided in activity_labels.txt using 'merge()'

6. This is *Step 5, make a tidy dataset with the average of each variable grouped by activity and subject*. 
  1. Make subject a factor for grouping
  2. group the data by activity and subject
  3. Find the means of each variable for each group, making a dataset of 81 columns (activity, subject, and the 79 mean and sd variables) and 180 observations (one row for each subject and activity pair)
  4. Output the data to a text file, "GettingandCleaning.txt", with space separators
    * This dataset now has a row for each activity/subject pair, and the values in the variable columns are the means of those variables within the activity/subject pair from the original dataset.

The resulting dataset is tidy because it has rows for each subject doing each activity (the observations), and the columns are each different measurements of those subjects.

There is an argument in Hadley Wickham's tidy data manifesto that another way to do this is to have a column identifying the variables by name, and another with their values. There are uses for such a dataset- e.g. if we want to group by different variables in ggplot2 such as putting the x,y,and z data on the same figure. This would, however, require serious subsetting of the data frame, since there are so many variables. And since the variables are fundamentally different measurements, I think it is more logical and fits with statistical thinking better to keep them as separate columns as I have done above.


