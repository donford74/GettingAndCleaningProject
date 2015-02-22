## Getting and Cleaning Data course project
This repository contains my Johns Hopkins Data Science Getting and Cleaning Data course project.
The contents are:
    The Code Book explaining the data: CodeBook.md
    The processing script: run_analysis.R
    This readme file: README.md

### Data Description
[Original data source](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[Class data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The run_analysis.R reads in the raw data files:
  Data:

    Measurements: (measurements and observations)
        X_test.txt
        X_train.txt

    Activity vector:  (correlates the observations with the activities)
        y_test.txt
        y_train.txt

          
    Subject vector:  (correlates the observations with the subjects)
        subject_test.txt
        subject_train.txt

It also reads in the descriptive files:
  Descriptions:
  
    Activities: (describes the activities)
        activity_labels.txt
  
    Features: (describes the measurements)
        features.txt
          
### Data Preprocessing Steps      
No preprocessing is required.
    
### Script Description
The overall purpose of the script is to read in the observations for mean() and std() measurements 
for both the training and test datasets. Combine them and appropriatly associate the measurements
with activities and subjects. Labeling both the measurements and observations with meaningful names.

The steps are as follows:
1.  Read the raw data measurements.
2.  Read the raw activity.
3.  Read the raw subjects.
4.  Read the variable indices and names.
5.  Read the activity indices and names.
6.  Select only the mean() and std() measurement indexes and names from the raw features.
7.  Select only the mean() and std() measurements from the raw data frames using the vector of indexes from the prior step.
8.  Add the mean() and std() measurement names to the train and test data frames of mean() and std() measurements using the vector of names from step 7.
9.  Add the subject indexes to the train and test data frames of mean() and std() measurements.
10. Add the activity indexes to the train and test subject indexed mean() and std() data frames.
11. Add the activity names to the train/test subject and activity indexed mean() and std() data frames.
12. In order to combine the test and train data they need unique row names. We also would like to be 
        able to identify which observations were from test and which from train. Set the row names so they 
        will be unique.
13. Merge the test and train data frames.
14. Write the intermediary file. This is the "Step 4" data referred to in the assignment. This step is 
		commented out in the "final" version.
15. Create a new data frame containing the averages of each measurement grouped by subject and activity.
  a.  Next create a list of labels for each average. This allows us to label all of the output columns.
  b.  Create the data frame with averages grouped by subject and activity.
    -  Also suppress the warnings from aggregate attempting to get the mean of the activity name column.
  c.  Remove the "SubjectIdx", "ActivityIdx", and "ActivityName" columns - they were invalidated by the aggregate.
  d.  Rename the columns to indicate that they are averages of those measures.
16. Write the Final file using write.table.
