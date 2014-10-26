
## Analyzing data collected from the accelerometers from the Samsung Galaxy S smartphone ##
## Operating System used : Windows 7 - 64 bit
## R Version: 3.1.1
## Essential Library - tidyr , base

## Data Source : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Description : The Zipped file contains information of 30 volunteers, where 70% of the volunteers was selected for 
##                    generating the training data and 30% the test data. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
##                    wearing a smartphone (Samsung Galaxy S II) on the waist



# Data Extraction begins :

# Extracting Training Data 

## X_train file contains all the measurements that have been recorded
## y_train file contains all the codes which represent Activities that the volunteers have gone through
## subject_train file contains the volunteer information

x_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt",stringsAsFactors=FALSE,sep="",header=F)
y_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE,sep="",header=F)
subject_train<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE,sep="",header=F)



# Extracting Test Data 

## X_test file contains all the measurements that have been recorded
## y_test file contains all the codes which represent Activities that the volunteers have gone through
## subject_test file contains the volunteer information

x_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt",stringsAsFactors=FALSE,sep="",header=F)
y_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE,sep="",header=F)
subject_test<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE,sep="",header=F)


# Extracting Feature file which describes all the measurement columns seen in Test and Training Data.

features<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/features.txt",stringsAsFactors=FALSE,sep="",header=F)

## Using Features table to update column names of Train and Test Dataset
names(x_train) <- as.character(features$V2)

names(x_test) <- as.character(features$V2)


# Extracting Activity file which describes all the Activities like WALKING, WALKING_UPSTAIRS etc seen in Test and Training Data.

activity_labels<-read.table("./getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE,sep="",header=F)

## Updating Column Names of Activity Data frame
names(activity_labels) <- c("activity","activity_desc")



################################# Merging of Data Started #################################


## Combining the columns of Subject_Train  and Y table into X_Train  

x_train_subject_y<-x_train %>%
                       cbind(subject=subject_train$V1) %>%
                      cbind(activity=y_train$V1)


## Combining the columns of Subject_test  and Y table into X_test 

x_test_subject_y_test <-x_test %>%
        cbind(subject=subject_test$V1) %>%
        cbind(activity=y_test$V1)


## Merging  Test and Train Data 
Merged_Train_Test<-rbind(x_train_subject_y,x_test_subject_y)


## Converting Table into Local Data Frame , so that we can apply features of dplyr package to tidy the data.
Test_Train_DF<-tbl_df(Merged_Train_Test)

################################# Merging of Data Completed #################################


############ Extracting only the measurements on the mean and standard deviation ############ 

## Identifying Mean and Std Columns using grep command. 
## Note we have not inluded columns with pattern " meanFreq " because these data are not mean value of the measurement
## rather mean value of one frequency

Filter_Test_Train_DF<-Test_Train_DF[,grepl("-mean\\(\\)|std|activity|subject", colnames(Test_Train_DF),ignore.case = T) ]


############ Extracting only the mean/std measurements Completed ############ 



######### Uses descriptive activity names to name the activities in the data set #########

## Using Left Join to Merge with Activity label table ; so that we get activity descriptions 
## and then dropping column Activity

Test_Train_DF_joined<-Filter_Test_Train_DF %>%
           join(activity_labels,type="left",by="activity") %>%
        select(-one_of("activity"))


######### Uses descriptive activity names Completed #########

#########  Appropriately labelling the data set with descriptive variable names ######



## Removing unnecessary characters which could cause problems later when we apply various functions on them
colnames(Test_Train_DF_joined) <- sub("\\(\\)", "", colnames(Test_Train_DF_joined))

colnames(Test_Train_DF_joined) <- sub("-", "_", colnames(Test_Train_DF_joined))

colnames(Test_Train_DF_joined) <- sub("-", "_", colnames(Test_Train_DF_joined))


#########  Labelling the data Completed ######


### Creating independent tidy data set with the average of each variable for each activity and each subject ####

## Using Group_By feature since we need to apply Mean Operations by grouping into 3 categories


final_tidy_set<-Test_Train_DF_joined %>%
        gather(measurement_type, measurement_value, -activity_desc,-subject)  %>%
        group_by(activity_desc,subject,measurement_type) %>%
        summarize(average = mean(measurement_value))


########### Creation of tidy data set completed  ##################


####### Dumping the data into Txt file ##########

write.table(final_tidy_set, file = "wearable_computing.txt", sep = " ",
            row.names = FALSE )


####### Analysis Completed ##########