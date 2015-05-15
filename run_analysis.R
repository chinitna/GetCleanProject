# Script to merge training and test data from samsung, extract mean and SD, rename, and
# create new dataset with average for each activity and subject
library(dplyr)
# 1: Read in the data

# Read in the test data
STest <- read.table("./UCI HAR Dataset/test/subject_test.txt")
# XT <- fread("./UCI HAR Dataset/test/X_test.txt", sep = "")
XTest <- read.table("./UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("./UCI HAR Dataset/test/y_test.txt")

# Read in the training data
Strain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
# XT <- fread("./UCI HAR Dataset/train/X_train.txt", sep = "")
Xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt")
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Read in the variables
features <- read.table("./UCI HAR Dataset/features.txt")
AL <- read.table("./UCI HAR Dataset/activity_labels.txt")

# 2: "Step 4": give descriptive variable names: ie put the features labels on the columns

# Name the columns of the x and y datasets, before I get confused
names(XTest) <- features$V2
names(Xtrain) <- features$V2

names(yTest) <- "Activity Label"
names(ytrain) <- "Activity Label"

names(STest) <- "subject"
names(Strain) <- "subject"

# 3: "Step 1": merge the training and test data

# Concatenate the x and y part of both the test and train datasets
Test <- cbind(yTest, STest, XTest)
train <- cbind(ytrain, Strain, Xtrain)

# Now put the test dataset on the end of the train dataset
merged <- rbind(Test, train)

# Clear out a bunch of unneeded dataframes
rm(STest, Strain, Test, train, XTest, Xtrain, yTest, ytrain)

# 4: "Step 2": Cut it down to just the means and standard deviation measurements
means <- grep("mean()", names(merged))
stds <- grep("std()", names(merged))
# Need to also keep columns 1 and 2 (the activity and subject columns)
mandsd <- c(1, 2, means, stds)

merged <- merged[ ,mandsd]

# 5: "Step 3": give descriptive activity names, using the "Activity Label" column of merged
# and the activity label code
names(AL) <- c("Activity Label", "Activity")
merged <- merge(AL,merged,by.x="Activity Label",by.y="Activity Label",all=TRUE)
merged[ ,"Activity Label"] <- NULL

# 6: Step 5: create a second, independent tidy data set with the average of each variable for
# each activity and each subject.

# Make activity and subject factors, and then find the means of all the other columns within them
as.factor(merged$subject)

groups <- group_by(merged, Activity, subject)

# Make a tidy dataset: it has rows for each subject doing each activity (the
# observations), and the columns are each different measurements of those subjects.
groupMean <- groups %>% summarise_each(funs(mean))

# Write the data to a text file
write.table(groupMean, file = "GettingAndCleaning.txt", sep = " ", row.names = FALSE)
