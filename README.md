##  Tidy Data Set Prepared using the experimental data from - Human Activity Recognition Using Smartphones Dataset

####Contents :

* Code File - run_analysis.R which creates tidy data set.

####Environment in which Script was prepared :
* Operating System: Windows 7 - 64 bit
* R Version : 3.1.1

#### Walk through for the R file created :

* Data needs be downloaded and unzipped beforehand . 
* Essential library that is utilized are tidyr , base etc.
* Train and Test files are imported using read.table . Feauture file is used to rename the columns.
* Features file, Subject Files and Activity Code Files [Y Files] are also imported.
* Firstly , Train File, Y Train File [Activity Info] , Subject Train File  are column binded . Similary Test Files are also column binded.
* Finally Train and Test files are Merged by row binding.
* Using Grep Pattern , columns with Mean and Standard Deviation are selected to prepare tidy data set.
* Activity Names are then merged into the resultant data set . Then the Activity column is dropped using select command.
* Column Names are refined again , since it had paranthesis and '-' characters which could create problems when we apply various functions.
* Finally a tidy data set is created , by first using the variables are observational rows , then group_by function is applied to activity, subject and
  measurment_type, so that we can calculated aggregated mean based upon these 3 factors.
* Lastly the final data set is dumped into a txt file called  : wearable_computing.txt


