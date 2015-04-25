============================================================
run_alalysis.R                                              
UCI HAR Dataset processing functions collection                                                            
============================================================            
last revision: 24.04.2015                                             
============================================================

This functions collection developed for UCI HAR Dataset processing.
See following publication for dataset detailes:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


This collection contains folling functions:
===========================================

Main processing function:
- 'run_anaysis': Returns data.frame (for results' data set detailes see 'CodeBook.md') with cleaned data from UCI HAR Dataset. Function makes following: 
  * gets data from test and train sets
  * decode labels to each set
  * preprocesses headers to make them readable
  * merges datasets with each other
  * adds subjects and readable labels
  * extracts only Mean and STD columns
  * creates a second, independent tidy data set with the average of each variable for each activity and each subject

Extra functions:
- 'get_data_from_file': Returns data.frame with data, getted from txt file specified in path parametr.

- 'features_clean': Prepares dataset headers by 
  removing '-',',','(',')' characters from each feature-name
  upcasing parts of names to make them unified and readable (e.g., mean -> Mean, std -> STD)


- 'clean_feat_name': Cleans a string passed in a ch parametr as follows:
  removes '-',',','(',')' characters 
  replaces parts of string according to a list:
    mean() -> Mean
    std() -> STD
    mad() -> MAD
    max() -> Max
    min() -> Min
    sma() -> SMA
    energy() -> Energy
    iqr() -> IQR
    entropy() -> Entropy
    arCoeff() -> ArCoeff
    correlation() -> Correlation
    maxInds() -> MaxInds
    meanFreq() -> MeanFreq
    skewness() -> Skewness
    kurtosis() -> Kurtosis
    bandsEnergy() -> BandsEnergy
    angle() -> Angle

- 'data_labels_clean': Creates a vector with decoded data labels. 
parameters:
  df - vector of coded labels
  labels - data.frame with code and label 
Example:
    1   -> WALKING
    2	-> WALKING_UPSTAIRS
    3	-> WALKING_DOWNSTAIRS
    4	-> SITTING
    5	-> STANDING
    6	-> LAYING