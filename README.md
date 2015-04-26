# Getting_and_Cleaning_Prog_Assgn

Programming assignment:
You should create one R script called run_analysis.R that does the following. 
Merges the training and the test sets to create one data set.
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names. 
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

Steps:
- Copy all the zip file in the same location where the script is
- Extract the zip folder
- Load the test Y and train Y data and replace the activity id with the activity description from the activity_labels file
- Load the test X and train X data and add column description from the features file
- Merge test X, test Y and test sub file to create one single test file. Do the same with train data sets
- Combine both test and train data to get single combined data set
- Select only columns with mean() and std() in the combined data set with activity and subject
- Calculate mean for each column by subject and activity to create a tidy file
- Create a txt file with the tidy data set created in previous step

