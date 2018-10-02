# base R includes some sample data, for instance 'mtcars'

?mtcars # view documentation using a "?" before a function or defualt dataset

mtcars # displays the data in the console

View(mtcars) # another way to view data

head(mtcars) # view the top of the data using 'head'


install.packages("here") # install a non-default library/package

library(here) # load the library in the workspacce

?here() # see what the main function of the package does 
# it should say that "here() starts at <localdirectory/.../chester-lab-R-tutorial"

# try writing a .csv file using the here() function and the mtcars data
write.csv(x = mtcars, file = here("mtcars.csv"))

# load the data back into the workspace
mtcars2 <- read.csv(file = here("mtcars.csv"))

# if you view both mtcars and mtcars2, you will see the left most column is now "X"
# to fix this, we must load the file with the argument row.names = TRUE
# look at the documentation for read.csv to see how to do this
?read.csv
mtcars3 <- read.csv(here("mtcars.csv"), row.names = 1) # specifies the first column in the table should be the row names

mean(mtcars$mpg) # calculate the mean miles per gallon
sd(mtcars$mpg) # standard deviation
plot(mtcars$mpg, mtcars$hp) # scatterplot of mpg vs. horsepower
boxplot(mtcars$mpg~mtcars$cyl) # boxplots of mpg by number of cylinders


# use ggplot2 (or tidyverse which contains ggplot2) for advanced plotting
# use install.packages() like before

library(ggplot2)

my.plot <- ggplot(data = mtcars, aes(x = mpg, y = hp)) + 
  geom_point() +
  theme_minimal() +
  ggtitle("mpg vs hp")
my.plot # print the plot

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


