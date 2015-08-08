# 1. Merging both data sets given into one data set.
# setwd("D:/Programming/Coursera/Getting-and-Cleaning-Data-Project")

tmp1 <- read.table("./data/train/X_train.txt")
tmp2 <- read.table("./data/test/X_test.txt")
X <- rbind(tmp1, tmp2)

tmp1 <- read.table("./data/train/subject_train.txt")
tmp2 <- read.table("./data/test/subject_test.txt")
S <- rbind(tmp1, tmp2)

tmp1 <- read.table("./data/train/y_train.txt")
tmp2 <- read.table("./data/test/y_test.txt")
Y <- rbind(tmp1, tmp2)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("./data/features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
X <- X[, indices_of_good_features]
names(X) <- features[indices_of_good_features, 2]
names(X) <- gsub("\\(|\\)", "", names(X))
names(X) <- tolower(names(X))

# 3. Uses descriptive activity names to name the activities in the data set.

activities <- read.table("./data/activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
cleaned <- cbind(S, Y, X)
write.table(cleaned, "merged_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

uniqueSubjects = unique(S)[,1]
numSubjects = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
result = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    result[row, 1] = uniqueSubjects[s]
    result[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}
write.table(result, "data_set_with_means.txt", row.names = FALSE)

# data <- read.table("./data_set_with_means.txt")
# data[1:12, 1:3]