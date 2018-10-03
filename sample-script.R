# base R includes some sample data, for instance the dataset 'mtcars' which we will use to explore the functionality of R

?mtcars # view documentation using a "?" before a function or defualt dataset
# you can also use a double ? "??" to search all libraries online to see if any functions exist by a name

# there are many ways to view the data
mtcars # displays the data in the console
View(mtcars) # another way to view data within the R Studio editor
head(mtcars) # output the top few rows of data in the console using the function 'head' 

# we also can check what types of classes the objects and data is in
class(mtcars) # check the class of the object mtcars
class(mtcars$mpg) # class of the variable mpg
?lapply # look at 'lapply' to see how to apply the 'class' function to all of 'mtcars' data
lapply(mtcars, class) # the class of all variables

# specific rows and columns can be called within brackets: data.frame[row.id,column.id] 
mtcars[1,] # view the first row
mtcars[,1] # vieww the first column
mtcars[1,1] # view the first data point (first row, first column)

# you can subset data
mtcars.mpg.over.25 <- subset(mtcars, mpg > 25)
min(mtcars.mpg.over.25$mpg) # check it worked

# calculate some values
mean(mtcars$mpg) # calculate the mean miles per gallon
sd(mtcars$mpg) # standard deviation

# plot some data
plot(mtcars$mpg, mtcars$hp) # scatterplot of mpg vs. horsepower
boxplot(mtcars$mpg~mtcars$cyl) # boxplots of mpg by number of cylinders

# you can also create sequences
1:10
?seq
seq(1:10)
seq(from = 2, to = 10, by = 2)

# you can use for loops
i <- integer() # create an empty integer value

for(i in 1:10){ # loop through a sequence and do arthemtic
  print(i / 2)
}

# you can create custom functions
x <- "hello" # store some string info
y <- "hola"

f <- function(a, b) { # create the function
  print(a)
  print(b)
}

f(x,y) # use the function
View(f) # view the function in the editor
class(f) # it is class 'function

# 


# install a non-default library/package (in this case 'here')
install.packages("here") 

library(here) # load a library in the workspacce
# it should say that "here() starts at <localdirectory>/.../chester-lab-R-tutorial"

?here() # lets see what the main function of the 'here' package does (it is also named here)

# try writing a .csv file using the here() function and the mtcars data
write.csv(x = mtcars, file = here("mtcars.csv"))
# this will write the data.frame to your local directory without you needing
# to specifcy the exact location on your local computer

# load the data back into the workspace
mtcars2 <- read.csv(file = here("mtcars.csv"))

# if you view both mtcars and mtcars2, you will see the left most column is now "X"
View(mtcars)
View(mtcars2)
# we can check the first column also
mtcars[,1]
mtcars2[,1]

# you can also check if they are equal
mtcars[,1] == mtcars2[,1] 
# this outputs a vector of logicals
# note that you use a 'double equals' to for an equal sign in an equation
# not equals is "!="
mtcars[,1] != mtcars2[,1] 

# to fix this issue, we must load the file with the argument row.names = TRUE
# look at the documentation for read.csv to see how to do this
?read.csv
mtcars3 <- read.csv(here("mtcars.csv"), row.names = 1) # specifies the first column in the table should be the row names



# use ggplot2 (or tidyverse which contains ggplot2) for advanced plotting
# use install.packages() like before

library(ggplot2)

my.plot <- ggplot(data = mtcars, aes(x = mpg, y = hp)) + 
  geom_point() +
  theme_minimal() +
  ggtitle("mpg vs hp")
my.plot # print the plot

class(my.plot)  # see the class of the plot object

my.plot2 <- ggplot(data = mtcars, aes(x = mpg, y = hp)) + 
  geom_point() +
  theme_bw() +
  ggtitle("mpg vs hp by cyl") +
  facet_grid(~cyl)

my.plot2 # print the plot

# save the plot2
ggsave(my.plot2, filename = here("plot2.png"))


# linear regression between mpg & hp
model1 <- lm(hp ~ mpg, data = mtcars)

# summary of output
summary(model1)

# base r plot with regression line
plot(mtcars$mpg, mtcars$hp) # Scatterplot of mpg vs. horsepower
abline(model1)

# ggplot can do this too
my.plot + stat_smooth(method = "lm", col = "blue")
my.plot2 + stat_smooth(method = "lm", col = "red")


