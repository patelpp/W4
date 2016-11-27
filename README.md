#Readme for Getting and Cleaning Data Project

>The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Review Critera:

1. The submitted data set is tidy.
2. The Github repo contains the required scripts.
3. GitHub contains a code book that modifies and updates the available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
4. The README that explains the analysis files is clear and understandable.
5. The work submitted for this project is the work of the student who submitted it.


## Files
+ **run_Analysis.R** - The final analysis script. This downloads the dataset, processes and tidies it for analysis then creates a tidy summary dataset for the final result. It meets the following requirements:
1.Merges the training and the test sets to create one data set.
2.Extracts only the measurements on the mean and standard deviation for each measurement.
3.Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


+ **TidyData.txt** - The final tidy summary dataset. Presents the mean of each measurement variable for each subject and activity combination.
+ **CodeBook.md** - Description of the variables, the data, and any transformations or work that you performed to clean up the data.
+ **UCI HAR Dataset** - Folder contains all the unzipped, raw data used for the project. Includes a README.txt to further explain the dataset in detail.