Getting and Cleaning Data Course Project

This file describes how run_analysis.R script works.


	- Download and unzip the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and rename the folder to "data" (without quotationmarks).

	- Make sure the folder "data" and the run_analysis.R script are both in the current working directory.
	
	- Then use the source("run_analysis.R") command in your RStudio.

	- After that you will find two new files in your directory
		
		- merged_data.txt: it'll contain a data frame called cleanedData with 10299*68 dimension.
		- data_with_means.txt : it'll contain a data frame as well called result with 180*68 dimension.

	- As a final step use data <- read.table("data_with_means.txt") command in RStudio to read the file. You will end up with 180 rows with all combinations for each of the 66 features 
	 (6 activities and 30 subjects in total as the average of each variable for each activity and each subject).