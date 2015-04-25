==================================================================

'cleaned_data.txt' contains cleaned version of UCI HAR Dataset

==================================================================

********************
*                  *
**  Study design  **
*                  *
********************

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Data gathered in Cleaned data set presents average of each variable for each activity and each subject.

Feature Selection from UCI HAR Dataset
======================================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

****************
*              *
**  CodeBook  **
*              *
****************
labels	- activities marks (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

subject - performs the activity for each window sample, integer from [1, 30]

Following group of variables represents averages of means for estimated signals. Pattern 'XYZ' shows signal direction X, Y and Z, 'Mean' shows mean value:

tBodyAccMeanX
tBodyAccMeanY
tBodyAccMeanZ
tGravityAccMeanX
tGravityAccMeanY	tGravityAccMeanZ	
tBodyAccJerkMeanX	
tBodyAccJerkMeanY	
tBodyAccJerkMeanZ	tBodyGyroMeanX	
tBodyGyroMeanY	
tBodyGyroMeanZ
tBodyGyroJerkMeanX	tBodyGyroJerkMeanY	
tBodyGyroJerkMeanZ	
tBodyAccMagMean	
tGravityAccMagMean	tBodyAccJerkMagMean	
tBodyGyroMagMean	
tBodyGyroJerkMagMean
fBodyAccMeanX	
fBodyAccMeanY	fBodyAccMeanZ	
fBodyAccJerkMeanX
fBodyAccJerkMeanY
fBodyAccJerkMeanZ	
fBodyGyroMeanX	fBodyGyroMeanY	
fBodyGyroMeanZ	
fBodyAccMagMean	
fBodyBodyAccJerkMagMean	fBodyBodyGyroMagMean	
fBodyBodyGyroJerkMagMean

Following group of variables represents averages of standard deviation for estimated signals. Pattern 'XYZ' shows signal direction X, Y and Z, 'STD' shows standard deviation:

tBodyAccSTDX
tBodyAccSTDY	
tBodyAccSTDZ	
tGravityAccSTDX	
tGravityAccSTDY	tGravityAccSTDZ
tBodyAccJerkSTDX
tBodyAccJerkSTDY	
tBodyAccJerkSTDZ	tBodyGyroSTDX
tBodyGyroSTDY
tBodyGyroSTDZ
tBodyGyroJerkSTDX
tBodyGyroJerkSTDY
tBodyGyroJerkSTDZ
tBodyAccMagSTD
tGravityAccMagSTD
tBodyAccJerkMagSTD	tBodyGyroMagSTD	
tBodyGyroJerkMagSTD	
fBodyAccSTDX	
fBodyAccSTDY	
fBodyAccSTDZ	fBodyAccJerkSTDX
fBodyAccJerkSTDY	
fBodyAccJerkSTDZ	
fBodyGyroSTDX	
fBodyGyroSTDY	fBodyGyroSTDZ	
fBodyAccMagSTD
fBodyBodyAccJerkMagSTD
fBodyBodyGyroMagSTD	fBodyBodyGyroJerkMagSTD