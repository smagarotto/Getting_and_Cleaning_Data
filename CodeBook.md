# CodeBook

This code book describes the variables, the data and any transformation that the script run_analysis.R performs to tidy up the data.

## The data source

Source dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## The dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

The dataset includes the following files:

- 'README.txt'
- 'features_info.txt': information about the variables used on the feature vector.
- 'features.txt': list of all features.
- 'activity_labels.txt': links the class labels with their activity name.
- 'train/X_train.txt': training dataset.
- 'train/y_train.txt': training labels.
- 'test/X_test.txt': test dataset.
- 'test/y_test.txt': test labels.
- 'train/subject_train.txt': the subject who performed the activity for each window sample.
- 'train/Inertial Signals/total_acc_x_train.txt': the acceleration signal from the smartphone accelerometer X axis (same for Y and Z axis).
- 'train/Inertial Signals/body_acc_x_train.txt': the body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': the angular velocity vector measured by the gyroscope for each window sample. 

## Transformation process

1. Merges the training and the test datasets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the dataset.
4. Appropriately labels the dataset with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## How ```run_analysis.R``` implements the above steps:

* Libraries required: ```dplyr``` and ```data.table```.
* Load all data (test and train).
* Load the features and activity labels.
* Extract the mean and standard deviation column names and data.
* Process the data. There are two parts processing test and train data respectively.
* Merge data set.
