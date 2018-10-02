# use the hashtag to create comments

# base R includes some sample data, for instance 'mtcars'

# view documentation using a "?" before a function or defualt dataset
?mtcars

# displays the data in the console
mtcars

# another way to view data
View(mtcars)

# view the top of the data using 'head'
head(mtcars)

# install a non-default library/package
install.packages("here")

# load the library in the workspacce
library(here)

# see what the main function of the package does
?here

# it should say that "here() starts at <localdirectory/.../chester-lab-R-tutorial"
write.csv(x = mtcars, file = here("mtcars.csv"))

# load the data back into the workspace
mtcars2 <- read.csv(file = here("mtcars.csv"))

# if you view both mtcars and mtcars2, you will see the left most column is now "X"
# to fix this, we must load the file with the argument row.names = TRUE
# look at the documentation for read.csv to see how to do this
?read.csv
mtcars3 <- read.csv(here("mtcars.csv"), row.names = 1) # specifies the first column in the table should be the row names



