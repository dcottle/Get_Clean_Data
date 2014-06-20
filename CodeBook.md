#Description of files in UCI HAR Dataset

README.txt: description of the experiments used in creating the dataset and attributes of the dataset

activity_labels.txt: enumeration of 6 activities in the study
*	1 WALKING
*	2 WALKING_UPSTAIRS
*	3 WALKING_DOWNSTAIRS
*	4 SITTING
*	5 STANDING
*	6 LAYING

features.txt: enumeration of 561 features measured in the study

features_info.txt: descriptive information about 561 features in
the test and train directories
	variables:
*		mean(): Mean value
*		std(): Standard deviation
*		mad(): Median absolute deviation 
*		max(): Largest value in array
*		min(): Smallest value in array
*		sma(): Signal magnitude area
*		energy(): Energy measure. Sum of the squares divided 				by the number of values. 
*		iqr(): Interquartile range 
*		entropy(): Signal entropy
*		arCoeff(): Autorregresion coefficients with Burg 				order equal to 4
*		correlation(): correlation coefficient between two 				signals
*		maxInds(): index of the frequency component with 				largest magnitude
*		meanFreq(): Weighted average of the frequency 					components to obtain a mean frequency
*		skewness(): skewness of the frequency domain signal 
*		kurtosis(): kurtosis of the frequency domain signal 
*		bandsEnergy(): Energy of a frequency interval within 				the 64 bins of the FFT of each window.
*		angle(): Angle between to vectors.
	signals:
*		tBodyAcc-XYZ
*		tGravityAcc-XYZ
*		tBodyAccJerk-XYZ
*		tBodyGyro-XYZ
*		tBodyGyroJerk-XYZ
*		tBodyAccMag
*		tGravityAccMag
*		tBodyAccJerkMag
*		tBodyGyroMag
*		tBodyGyroJerkMag
*		fBodyAcc-XYZ
*		fBodyAccJerk-XYZ
*		fBodyGyro-XYZ
*		fBodyAccMag
*		fBodyAccJerkMag
*		fBodyGyroMag
*		fBodyGyroJerkMag
		(XYZ above is an abbreviation referring to 3 signals 				in the X, Y, and Z directions)

subject_test.txt and subject_train.txt:
	enumeration of the subjects who performed the activity for 	each sample for the test and training sets

y_test.txt and y_train.txt:
	enumeration of each of the activities used for each sample 	of the test and training sets

X_test.txt and X_train.txt:
	experimental results used in the test and training 	datasets

Inertial Signals files:
	raw data used in calculation of the X_test and X_train 	sets; not used in tidy dataset creation

#Methods and data structures

Initial datasets were formed by combining the train and test datasets. 
A subset 79 features representing mean and standard deviation properties was selected from the complete set of 561 features. All features including the term "mean" in their feature name were selected. These features formed columns of the dataset to be processed.

Additional columns corresponded to subjects and activities formed the remaining 2 columns of the dataset.

Column structure of dataset:
*	column 1: subject
*	column 2: activity_name
*	columns 3-81: features based on measured properties, with 			names derived from the features.txt file
	
Subsests of datasets were derived from feature datasets based on Xtest.txt and X_train.txt by filtering the columns based on mean and standard deviation. Train and test datasets were formed from the filtered feature dataset, subject_test.txt and subject_train.txt for a subject column, and y_test.txt and y_train.txt for an activity column. The train and test datasets were combined into a single dataset.

Rows of the combined dataset were selected based on the 180 combinations of 30 subjects and 6 activities.

Means of each feature column were calculated for each subject-activity combination, giving a final dataset of 81 columns and 180 rows.


