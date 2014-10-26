##  Tidy Data Set Prepared using the experimental data from - Human Activity Recognition Using Smartphones Dataset

#### BackGround Information regarding the original experiment :

* The experiments had been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

* The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
  

#### Operations Peformed to the Clean up the Data Set

* Initially the data had 561 variables for Training and Test Experiment ; but all of these columns did not contain mean and standard deviation.
  So the unwanted columns were stripped out resulting to just 66 variables.
  
* Subject Information was in separate files ; so these information was added into its repective training and test data set.

* Activity Codes in Y Files was updated with descriptions using Activity information files. Now information like Walking , Laying can be seen directly.

* Column names were renamed to give them true meaning for what they stand for and were treated as observations , thus transformed into rows.
  
  
#### Variables seen in the Tidy data  and their descriptions : 

* activity_desc : This column contains activities i.e WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

* subject : This column contains information regarding the subject who volunteered the experiment.

* measurement_type : 
  * This columns shows various mean and standard deviation for each measurement like tBodyAcc, tGravityAcc , tBodyAccJerk . 
  * t and f in the column name stand for time and frequency domain 
  * X , Y , Z in column names is used to denote 3-axial signals in the X, Y and Z directions.
  * There are 66 Levels 
					 
* average : Average of each filtered variable is calculated for each activity_desc, and subject .

