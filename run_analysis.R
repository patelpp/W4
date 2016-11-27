run_analysis <- function () {
  library(dplyr)
  library(data.table)
  
  
  if(file.exists("./data")){unlink("./data", recursive = TRUE)}
  dir.create("./data")
  fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  #Download Data
  download.file(fileUrl,destfile="./data/Dataset.zip",method="curl")
  #Unzip
  unzip(zipfile="./data/Dataset.zip",exdir="./data")
  
  ### Step 1 Merges the training and the test sets to create one data set.
  ##Read test data in R
  #X: data/ Y:labels
  test_X = read.table("./data/UCI HAR Dataset/test/x_test.txt")
  test_Y = read.table("./data/UCI HAR Dataset/test/y_test.txt")
  test_subject = read.table("./data/UCI HAR Dataset/test/subject_test.txt")
  ##Read train data in R
  train_X = read.table("./data/UCI HAR Dataset/train/x_train.txt")
  train_Y = read.table("./data/UCI HAR Dataset/train/y_train.txt")
  train_subject = read.table("./data/UCI HAR Dataset/train/subject_train.txt")
  ##Combine test and train data 
  data_combine <- rbind(test_X , train_X) 
  labels_combine <- rbind(test_Y , train_Y)
  subjects_combine <- rbind(test_subject, train_subject)
  
  
  ###Step 2 Extracts only the measurements on the mean and standard deviation for each measurement.
  ## 
  features <- read.table("./data/UCI HAR Dataset/features.txt")
  mean_std_col <- grep("(.*)mean[^F]|std(.*)",features[,2])
  data_mean_std <- data_combine[,mean_std_col]
  
  
  ###Step4 3 Uses descriptive activity names to name the activities in the data set
  act_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
  Activity <- right_join(act_labels, labels_combine, by ="V1")
  Activity <- select(Activity, Activity = V2)
  
  ###Step 4 Appropriately labels the data set with descriptive variable names.
  fin_labels <- as.vector(features[mean_std_col,2])
  fin_labels <- sub("mean\\(\\)","Mean",fin_labels)
  fin_labels <- sub("std\\(\\)","SD",fin_labels)
  
  names(data_mean_std) <- fin_labels
  subjects_combine$V1 <- as.factor(subjects_combine$V1)
  names(subjects_combine) <- "SubjectID"
  total_data <- bind_cols(subjects_combine, Activity, data_mean_std)
  
  ####From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
  total_data <- data.table(total_data)
  Tidy <- total_data[, lapply(.SD, mean), by = 'SubjectID,Activity']
  write.table(Tidy, "TidyData.txt", row.name=FALSE)
}