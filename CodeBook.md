Getting and Cleaning Data Course Project Code Book

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

How does the R script "run_analysis.R" perform the cleaning of the data?

- It merges the training and test sets to create one data set.

- It reads features.txt and extracts only the measurements on the mean and standard deviation for each measurement. 
  The result is a 10299x66 dimensional data frame, because only 66 out of 561 attributes are measurements on the mean
  and standard deviation.

- It reads activity_labels.txt and applies descriptive activity names to name the activities in the data set

- The script also appropriately labels the data set with descriptive names: all feature names (attributes) and activity 
  names are converted to lower case, underscores and brackets () are removed. Then it merges the 10299x66 dimensional data frame containing features with 10299x1 dimensional data frames containing activity labels and subject IDs. The result is saved as merged_data.txt.

- In the last step the script creates a second, independent tidy data set with the average of each measurement for each 
  activity and each subject. The result is saved as data_set_with_means.txt with 30 subjects and 6 activities, 
  so 180 rows in this data set with averages.
