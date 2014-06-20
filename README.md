Get_Clean_Data
==============

The run_analysis.R script in this repo loads files from the UCI HAR Dataset, and converts a subset of the dataset
into a tidy dataset.

The script may be run from the R console, and returns a dataframe (tidy) as the tidy dataset.

The tidy dataframe can be locally saved as a file, for example using the command write.csv(tidy, file="tidy.csv") to 
store the dataframe as a csv file. By default, the file will be stored in the ... directory, but this can be
changed by specifying a complete path as an argument to write.csv().
