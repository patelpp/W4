# Getting Clean Data Project Code book

Code book describes the variables, the data, and any transformations or work performed to clean up the data.

##Study Design
Data comes from companies like Fitbit, Nike, and Jawbone Up which are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data is unzipped and raw data is seprated into test and training datasets.

##1. Merges training and test set to create three data sets called data_combine, labels_combine, and subjects_combine. This is based on the corresponding data variables.
##2. Extractions of only the mean and standard deivation for each measurement. Combines them into a seperate table called data_mean_std.
##3. Activity names are correctly labeled in the final data set. The descriptive names are pulled from activity_labels.txt and joined by the activity number.
##4. Appropriately labels the data set. mean is converted to Mean and std to SD. The final data is created called total_data.
##5. A second tidy data set with the average of each variable for each activity and each subject is created. Mean for each measurement variable is labeled with "Mean". The dataset is outputed as a TidyData.txt file.

