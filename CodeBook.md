# CodeBook - an explanation of the output variables for the Getting and Cleaning Data Course Project

## Input Data Feature Selection 
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
  
    Features: (labels the measurements)
        features.txt

See the features_info.txt file for full details.

From that file we have the following:
>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>
>These signals were used to estimate variables of the feature vector for each pattern:  
>'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>
>* tBodyAcc-XYZ
>* tGravityAcc-XYZ
>* tBodyAccJerk-XYZ
>* tBodyGyro-XYZ
>* tBodyGyroJerk-XYZ
>* tBodyAccMag
>* tGravityAccMag
>* tBodyAccJerkMag
>* tBodyGyroMag
>* tBodyGyroJerkMag
>* fBodyAcc-XYZ
>* fBodyAccJerk-XYZ
>* fBodyGyro-XYZ
>* fBodyAccMag
>* fBodyAccJerkMag
>* fBodyGyroMag
>* fBodyGyroJerkMag

The problem statement asked for the averages of the means and standard deviavions. Therefore, the variables that were used of those that were estimated from these signals are: 

>* mean(): Mean value
>* std(): Standard deviation
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>
>* gravityMean
>* tBodyAccMean
>* tBodyAccJerkMean
>* tBodyGyroMean
>* tBodyGyroJerkMean

>The complete list of variables of each feature vector is available in 'features.txt'

## Output Data 
The output data is the average of each measurement grouped by test subject and activity. 
Except for "Subject", the test subject index, and "Activity", the name of the activity, each output column is the average of one of the input measurements. The output columns are:
- Subject
- Activity
- average of tBodyAcc-mean()-X
- average of tBodyAcc-mean()-Y
- average of tBodyAcc-mean()-Z
- average of tBodyAcc-std()-X
- average of tBodyAcc-std()-Y
- average of tBodyAcc-std()-Z
- average of tGravityAcc-mean()-X
- average of tGravityAcc-mean()-Y
- average of tGravityAcc-mean()-Z
- average of tGravityAcc-std()-X
- average of tGravityAcc-std()-Y
- average of tGravityAcc-std()-Z
- average of tBodyAccJerk-mean()-X
- average of tBodyAccJerk-mean()-Y
- average of tBodyAccJerk-mean()-Z
- average of tBodyAccJerk-std()-X
- average of tBodyAccJerk-std()-Y
- average of tBodyAccJerk-std()-Z
- average of tBodyGyro-mean()-X
- average of tBodyGyro-mean()-Y
- average of tBodyGyro-mean()-Z
- average of tBodyGyro-std()-X
- average of tBodyGyro-std()-Y
- average of tBodyGyro-std()-Z
- average of tBodyGyroJerk-mean()-X
- average of tBodyGyroJerk-mean()-Y
- average of tBodyGyroJerk-mean()-Z
- average of tBodyGyroJerk-std()-X
- average of tBodyGyroJerk-std()-Y
- average of tBodyGyroJerk-std()-Z
- average of tBodyAccMag-mean()
- average of tBodyAccMag-std()
- average of tGravityAccMag-mean()
- average of tGravityAccMag-std()
- average of tBodyAccJerkMag-mean()
- average of tBodyAccJerkMag-std()
- average of tBodyGyroMag-mean()
- average of tBodyGyroMag-std()
- average of tBodyGyroJerkMag-mean()
- average of tBodyGyroJerkMag-std()
- average of fBodyAcc-mean()-X
- average of fBodyAcc-mean()-Y
- average of fBodyAcc-mean()-Z
- average of fBodyAcc-std()-X
- average of fBodyAcc-std()-Y
- average of fBodyAcc-std()-Z
- average of fBodyAcc-meanFreq()-X
- average of fBodyAcc-meanFreq()-Y
- average of fBodyAcc-meanFreq()-Z
- average of fBodyAccJerk-mean()-X
- average of fBodyAccJerk-mean()-Y
- average of fBodyAccJerk-mean()-Z
- average of fBodyAccJerk-std()-X
- average of fBodyAccJerk-std()-Y
- average of fBodyAccJerk-std()-Z
- average of fBodyAccJerk-meanFreq()-X
- average of fBodyAccJerk-meanFreq()-Y
- average of fBodyAccJerk-meanFreq()-Z
- average of fBodyGyro-mean()-X
- average of fBodyGyro-mean()-Y
- average of fBodyGyro-mean()-Z
- average of fBodyGyro-std()-X
- average of fBodyGyro-std()-Y
- average of fBodyGyro-std()-Z
- average of fBodyGyro-meanFreq()-X
- average of fBodyGyro-meanFreq()-Y
- average of fBodyGyro-meanFreq()-Z
- average of fBodyAccMag-mean()
- average of fBodyAccMag-std()
- average of fBodyAccMag-meanFreq()
- average of fBodyBodyAccJerkMag-mean()
- average of fBodyBodyAccJerkMag-std()
- average of fBodyBodyAccJerkMag-meanFreq()
- average of fBodyBodyGyroMag-mean()
- average of fBodyBodyGyroMag-std()
- average of fBodyBodyGyroMag-meanFreq()
- average of fBodyBodyGyroJerkMag-mean()
- average of fBodyBodyGyroJerkMag-std()
- average of fBodyBodyGyroJerkMag-meanFreq()
- average of angle(tBodyAccMean,gravity)
- average of angle(tBodyAccJerkMean),gravityMean)
- average of angle(tBodyGyroMean,gravityMean)
- average of angle(tBodyGyroJerkMean,gravityMean)
- average of angle(X,gravityMean)
- average of angle(Y,gravityMean)
- average of angle(Z,gravityMean)


