x <- paste(getwd(),"/UCI HAR Dataset",sep="")
setwd(toString(x))

#Loading all necessary datasets into variables
featureslabels <- read.table("features.txt")
test_set <- read.table("./test/X_test.txt",col.names=featureslabels[,2])
test_labels <- read.table("./test/y_test.txt",col.names = "activity")
train_set <- read.table("./train/X_train.txt",col.names=featureslabels[,2])
train_labels <- read.table("./train/y_train.txt",col.names = "activity")
activity_names <- read.table("activity_labels.txt")
subject_test <- read.table("./test/subject_test.txt", col.names = c('subject'))
subject_train <- read.table("./train/subject_train.txt", col.names = c('subject'))

# 1. Merging the test and training sets to create one data set.
merged <- rbind(test_set,train_set)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement.
filteredfeatures <- featureslabels[grep("(mean|std)\\(", featureslabels[,2]),]
merged <- merged[,filteredfeatures[,1]]

# 3. Using descriptive activity names to name the activities in the data set
m_labels <- rbind(test_labels,train_labels)

for (i in 1:nrow(activity_names)) {
        code <- as.numeric(activity_names[i, 1])
        name <- as.character(activity_names[i, 2])
        m_labels[m_labels$activity == code, ] <- name
}

# 4. Appropriately labeling the data set with descriptive variable names.
merged_w_labels <- cbind(m_labels,merged)

# 5. Creating a second, independent tidy data set with the average of each variable 
#    for each activity and each subject. 
subject <- rbind(subject_test, subject_train)
averages <- aggregate(merged, by = list(activity = m_labels[,1], subject = subject[,1]), mean)

#writing the results in new files
write.csv(merged_w_labels,file="merged.txt",row.names=FALSE)
write.csv(averages, file="averages.txt", row.names=FALSE)
