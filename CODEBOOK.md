Code Book

This code book includes information about the source data, the transformations performed after collecting the data and some information about the resulting data sets.

Source Data
All the source data was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to complete the coursera assignment.

Transformations Performed
1. Merging the training and the test sets to create one data set.
2. Extracting only the measurements on the mean and standard deviation for each measurement.
3. Using descriptive activity names to name the activities in the data set
4. Appropriately labeling the data set with descriptive variable names.
5.From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.

All these operations are performed by the R script run_analysis available in xxx

Resulting data sets
The resulting txt files are the following:
- merged.txt: contains the measurements on the mean and standard deviation for each measurement, labelled with descriptive variable names.
- averages.txt: contains the average of each variable for each activity and subject.

