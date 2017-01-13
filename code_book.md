

# Code Book

The analysis script loads activity lables, features, XY test and train data sets and subject data sets.
I passed on the second column of the features data set as the column names for X and Y test and train sets.
X  , Y and S sets were combined by merging the columns together to form the subjuct column, activity column and feature columns.
The final full data set was put together by binding the rows of test and train sets.
I created a subset of columns of subject, activity, mean() and std() measurments only, other measurements  that contained word mean in it were left out.
I used activity lables data set as a lookup to give descriptive names to activities.
Next I gave more descriptive names to variable by separeting the camel case and using the underscore.
Finally I used the dplyr library to group the subuject and activities together and to find the mean of all the variables by subject and activity. 
I chose not to reshape the data, I believe it to be tidy. While not very familiar with the subjects and the physics of it, I feel that all the measurements are part of a single subject-activity observation. Each measurment mean is a variable and not independent observation like year, week, income etc. So I went with the wide dataset. 


1. Subject. Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

2. Activity. Identifies the actifities performed while tracking the measurments.
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

For columns 3 through 68 please see the desctiprion below. Each column contains a mean of all of the below measurements.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

