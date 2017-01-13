#load activity lables
alab <- read.table("activity_labels.txt") # 6 x 2

#load measurements
features <- read.table("features.txt") #561 x  2

#load train data
x_train <- read.table("./train/X_train.txt") # 7352 x 561
y_train <- read.table("./train/y_train.txt") # 7352 x   1

#load test data
x_test <- read.table("./test/X_test.txt") # 2947 x 561
y_test <- read.table("./test/y_test.txt") # 2947  x  1

#name the columns for test set
names(x_test) <- features$V2
names(y_test) <- 'Activity'

#name the columns for train set
names(x_train) <- features$V2
names(y_train) <- 'Activity'

#load subject data
s_test <- read.table("./test/subject_test.txt") # 2947  x  1
s_train <- read.table("./train/subject_train.txt") #  7352  x  1

#name s_train columns
names(s_train) <- 'Subject'
#name s_test columns
names(s_test) <- 'Subject'

#merge x and y and s train
syx_train <- cbind(s_train, y_train, x_train) #7352 x 563

#merge s , y and x test
syx_test <- cbind(s_test, y_test, x_test) #2947 x 563

#merge all test and train sets
final_set <- rbind(syx_test, syx_train) #10299 x 563

#extract first two columns
two_cols <- final_set[, c(1,2)] #10299 x 2

#subset mean and std data_frame
meanstd_df <- final_set[, grep("-mean\\(\\)|-std\\(\\)", names(final_set))] #10299 x 66 

#combine to create the data frame

full_df <- cbind(two_cols, meanstd_df) #10299 x 68

library(qdapTools)
#replace activity code with labels
full_df$Activity <- lookup(full_df$Activity, alab)

library(qdap)
#separate camel case
names(full_df) <- gsub("([A-Z])", " \\1", names(full_df))
old <- c('t ', ' Acc', 'f ', ' Mag')
new <- c('time_', '_acceleration', 'frequency_', '_magnitude')
#give descriptive names
names(full_df) <- mgsub(old, new, names(full_df))
names(full_df) <- gsub(" ", "_", names(full_df))

#group_by subject and activity
library(dplyr)
sub_act_tbl <- group_by(full_df, Subject, Activity)

#get mean  of each measurment
mean_df = summarize_each(sub_act_tbl, funs(mean))
mean_df = as.data.frame(mean_df) #180x68
names(mean_df) <- gsub("_Body_Body", "_Body", names(mean_df))

#save the final data frame
write.table(mean_df, "subject_activity.txt")
