##  Data collected from the accelerometers from the Samsung Galaxy S smartphone

### BackGround Information regarding the experiment :

* The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

* The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 
  These data have now been merged into one tidy data set.


### Variables seen in the Tidy data  and their descriptions : 

* activity_desc : This column contains activities i.e WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* subject : This column contains information regarding the subject who volunteered the experiment.
* measurement_type : a) This columns shows various mean and standard deviation for each measurement like tBodyAcc, tGravityAcc , tBodyAccJerk . 
                     b) t and f in the column name stand for time and frequency domain 
					 c) X , Y , Z in column names is used to denote 3-axial signals in the X, Y and Z directions.
* average : Average of each filtered variable is calculated for each activity_desc, and subject .

