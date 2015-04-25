###########################################################
##                                                        #
## UCI HAR Dataset processing functions collection        #
##                                                        #
##  run_analysis()                                        #
##  should be called to start processing                  #
##                                                        #
## 24.04.2015                                             #
##                                                        #
###########################################################
#
# Functions list: 
##     run_anaysis, get_data_from_file, features_clean, clean_feat_name, data_labels_clean
#

#
## run_analysis prepares result dataset
##
## CONSTRAINS: path speciafied without finishing "/" 
## according to Win path-format
##
## Returns: data_frame with processed data
#
run_analysis = function(){
  path <- "UCI HAR Dataset/"
  test_path = paste(path,"test/",sep="")
  train_path = paste(path,"train/",sep="")  
  
  ## getting test data
  #### X_test.txt
  xtest <- get_data_from_file(paste(test_path,"X_test.txt",sep=""))
  #### y_test.txt
  ytest <- get_data_from_file(paste(test_path,"y_test.txt",sep=""))
  #### subjects.txt
  subject_test <- get_data_from_file(paste(test_path,"subject_test.txt",sep=""))
  
  ## getting train data
  #### X_train.txt
  xtrain <- get_data_from_file(paste(train_path,"X_train.txt",sep=""))
  #### y_train.txt
  ytrain <- get_data_from_file(paste(train_path,"y_train.txt",sep=""))
  #### subjects.txt
  subject_train <- get_data_from_file(paste(train_path,"subject_train.txt",sep=""))
  
  ## getting labels names from activity_labels.txt
  activity_labels <- get_data_from_file(paste(path,"/activity_labels.txt",sep=""))
  
  ## getting datasets column names from features.txt
  features <- get_data_from_file(paste(path,"/features.txt",sep=""))
  
  ## step 4 (part 1, preparation)
  ## headers processing
  data_headers <- features_clean(features)
  
  ## step 3 
  ## decode activities to labels
  labels_test <- data_labels_clean(ytest,activity_labels)
  labels_train <- data_labels_clean(ytrain,activity_labels)
    
  ## step 1 (merging)
  ## binding cleaned labels to datasets
  merged_data <- rbind(xtest, xtrain)
  
  ## step 4(part 2, descriptive headers)
  colnames(merged_data) <- data_headers
  
  ## adding subjects
  subject <- rbind(subject_test, subject_train)
  names(subject)[1]<-"subject"
  merged_data <- cbind(subject, merged_data)
  
  ## adding readable labels
  labels <- c(labels_test, labels_train)
  merged_data <- cbind(labels,merged_data)
  
  ## unique columns
  merged_data <- merged_data[,unique(colnames(merged_data))]
  
  ## step 2 
  ## leave only STD and Mean colums
  cleaned_data <- select(merged_data, labels, subject, contains("STD"),contains("Mean"),-contains("angle"),-contains("freq",ignore.case=T))
   
  # step 5 
  ## average of each variable for each activity and each subject
  result <- summarise_each(group_by(cleaned_data,labels,subject), funs(mean))
  return(result)
  
}

## function of getting dataframe from a txt file
## parametr - path to a file
get_data_from_file = function(path){
  data <- read.table(path)
  return(data)
}


## function of dataset headers prepartion
## removes -,() from each feature
## uses clean_feat_name()
features_clean = function(df) {
  tmp <- clean_feat_name(as.character(df[1,]$V2))
  newDF <- tmp
  i <- 2
  while(i <= nrow(df)) {    
    tmp <- clean_feat_name(as.character(df[i,]$V2))
    newDF <- rbind(newDF,tmp)
    i<-i+1
  }
  return(newDF)
}
## clean features names function
## -,() removing from string
##
## ch - cleaned string
clean_feat_name = function(ch){
  tmp <-gsub("-","",ch)
  tmp <-gsub(",","",tmp)
  ## because of little number of functions
  ## replace each name, without extra automation
  tmp <-gsub("mean\\(\\)","Mean",tmp)
  tmp <-gsub("std\\(\\)","STD",tmp)
  tmp <-gsub("mad\\(\\)","MAD",tmp)
  tmp <-gsub("max\\(\\)","Max",tmp)
  tmp <-gsub("min\\(\\)","Min",tmp)
  tmp <-gsub("sma\\(\\)","SMA",tmp)
  tmp <-gsub("energy\\(\\)","Energy",tmp)
  tmp <-gsub("iqr\\(\\)","IQR",tmp)
  tmp <-gsub("entropy\\(\\)","Entropy",tmp)
  tmp <-gsub("arCoeff\\(\\)", "ArCoeff",tmp)
  tmp <-gsub("correlation\\(\\)", "Correlation",tmp)
  tmp <-gsub("maxInds\\(\\)", "MaxInds",tmp)
  tmp <-gsub("meanFreq\\(\\)", "MeanFreq",tmp)
  tmp <-gsub("skewness\\(\\)", "Skewness",tmp)
  tmp <-gsub("kurtosis\\(\\)", "Kurtosis",tmp)
  tmp <-gsub("bandsEnergy\\(\\)", "BandsEnergy",tmp)
  tmp <-gsub("angle\\(\\)", "Angle",tmp)
  return(tmp)
}

## change data labels from numbers to string values
##  1 WALKING
##  2	WALKING_UPSTAIRS
##	3	WALKING_DOWNSTAIRS
##	4	SITTING
##	5	STANDING
##	6	LAYING
##
### df - numbers
### labels - string labels
data_labels_clean=function(df,labels) {
  i <-1
  result <- c()
  while( i <= nrow(df)) {
    ## geting vector with string labels
    result <-c(result,as.character(labels[labels$V1==df[i,"V1"],"V2"]))
    i <- i+1
  }
  return(result)
}