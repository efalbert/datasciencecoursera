As instructed by the Project Guidelinnes, a executable TidyData Script was created and given the name run_analysis.R. It creates an output that displays data after having been sorted and cleaned

The Steps were as followed:

Step 1:
Extract and download the data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip; and create a folder called UCI HAr

Step 2:
Assign variables to its respective data for example;
features <- fread(file.path(path, "UCI HAR Dataset/features.txt")

Step 3:
Merge the training and the test to create a singular readable dataset for example:
# merge datasets and add labels
combined <- rbind(train, test)
AND
# Convert classLabels to activityName basically. More explicit. 
combined[["Activity"]] <- factor(combined[, Activity]
                                 , levels = activityLabels[["classLabels"]]
                                 , labels = activityLabels[["activityName"]])
                                 
Step 4:
Present the dataset after having been appropriately labelled, cleaned and organized using --
data.table::fwrite(x = combined, file = "tidyData.csv", quote = FALSE)
