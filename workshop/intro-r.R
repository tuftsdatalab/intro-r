pe##
##  _______     __ _         _____        _          _           _
## |__   __|   / _| |       |  __ \      | |        | |         | |
##    | |_   _| |_| |_ ___  | |  | | __ _| |_ __ _  | |     __ _| |__
##    | | | | |  _| __/ __| | |  | |/ _` | __/ _` | | |    / _` | '_ \
##    | | |_| | | | |_\__ \ | |__| | (_| | || (_| | | |___| (_| | |_) |
##    |_|\__,_|_|  \__|___/ |_____/ \__,_|\__\__,_| |______\__,_|_.__/
##
##            Innovate. Analyze. Visualize. | datalab.tufts.edu
##
##  ---------------------------------------------------------------------------
##  Title:        Introduction to the Statistical Programming Language R
##  Last update:  GH_ACTIONS_DATE
##  Written by:   Uku-Kaspar Uustalu & Kyle Monahan
##  Contact:      datalab-support@elist.tufts.edu
##  Website:      go.tufts.edu/introR
##  Resources:    go.tufts.edu/R
##  ---------------------------------------------------------------------------



##  ---------- Comments -------------------------------------------------------

# You write a comment by adding a "#" to the start of a line in an R script.
# Or you could select the lines you wish to comment and press Ctrl + Shift + C.
# We will not be writing a script, only running one, but the idea is the same.
# The text in GREEN (if you are using the default theme) is a comment.



##  ---------- Assigning Variables --------------------------------------------

# The first thing we can do is assign a variable.
# This looks like an arrow placing a value into a variable.
# Like this: n <- 200.

# To assign the variable, we need to run the code below.
# One option is to just press the "Run" button in the upper-right.
# Doing so will automatically run the next line of runnable code.
# To specify a line of code to run, simply select it or place your cursor on it.
# You can also press Ctrl+Enter/Return instead of clicking the "Run" button.

# Go ahead and run the code below.
# Remember to run all lines or chunks of code as you walk though this script.

n <- 200

# Now if you call n, you will see the console report its value.

n



##  ---------- Console Window -------------------------------------------------

# YOUR TURN: Try setting n <- 300 in the Console Window!
# It is just like line 46 above. After you are done, print n.

# If you cannot see the Console Window, click on the word "Console" below.

# Try typing N in the Console Window. What happens?
# The variable N is not found, because n is the name of the variable, not N.
# R is case-sensitive!



##  ---------- Functions and Vectors ------------------------------------------

# What if you have multiple numbers to set as a variable?
# For example, what if we wanted to store the scores we got on exams?
# These include 94, 96, 72, and 92. (The third test was really hard.)

# We use the combine function, which is c(n, n, n, ... n)

scores <- c(94, 96, 72, 92)

# This assigns our scores to the variable "scores" in the Environment.
# If we call the variable...

scores

# We see the values are printed. This is called a vector.
# One can access the values within a vector by using square braces [].
# To get the second score, we use...

scores[2]

# Note that R is one-indexed. To get the first score, we use [1], not [0].



##  ---------- Operators ------------------------------------------------------

# To check if a vector contains an element, we can use the %in% operator.

96 %in% scores

# It returns TRUE if the vector contains the element...

100 %in% scores

# ...and FALSE if it does not. TRUE and FALSE are boolean datatypes, also known
# as logical datatypes in R. These are commonly used to denote binary variables.



##  ---------- Descriptive Statistics -----------------------------------------

# The best thing about having multiple values to work with is that we can
# calculate various statistics. Most statistical functions in R easily take
# a whole vector as input. Let us see what our final semester score would be!

mean(scores)    # mean
median(scores)  # median
sd(scores)      # standard deviation



##  ---------- Running from History -------------------------------------------

# Take a look at the History tab on the right next to the Environment tab.
# This is where you will find commands you have run in the past.
# If you double click one, it will auto fill in the Console below.

# Select a command from the History tab and double-click on it.
# Then select the console window and press Enter/Return to run the command.



##  ---------- The Environment ------------------------------------------------

# Now click on the Environment tab. We see two objects, labeled as Values.
# These include scores and n.

# If you ever forget objects and do not want to click on the Environment tab,
# you can always call the function objects() for a list of all object names.

objects()



##  ---------- Modifying a Vector ---------------------------------------------

# Suddenly, we were able to retake a test. Great!
# Now we have to replace the value of 72 (the lowest score) with our new score
# of 85. We can assign the new value to the specific index we want to replace.

scores[3] <- 85



##  ---------- Saving Variables and Creating Tables ---------------------------

# Re-calculate stats given our retake and create new values to store them.
# In R you can store almost anything as a variable, and you should take
# advantage of that. Always save anything that you might need going forward.

scores_mean <- mean(scores)
scores_median <- median(scores)
scores_sd <- sd(scores)

# To store the values, remember to assign them to variables.
# Now we can create a table with a function called rbind():

scores_table <- rbind(Mean = scores_mean,
                      Median = scores_median,
                      SD = scores_sd)
scores_table

# When creating the table, we save it as an object (scores_table).
# This allows us to refer back to this table at any point later in the script.

class(scores_table)

# We can see that our scores_table is a matrix. Matrices are the most primitive
# form of table supported in R. Although matrices support both row and column
# names, they are not best structure to use for working with tabular data.

rownames(scores_table)
colnames(scores_table)

# Note how our column is unnamed. We can easily fix this as follows.

colnames(scores_table) <- c('Value')
scores_table

# You can round values to the nearest whole number using the round() function:
round(scores_table)

# But what if we wanted to keep a certain number of decimal places?
# We can use help() to pull up the function's documentation and investigate.
help(round)

# Looks like we can specify an additional argument named "digits" to do this:
round(scores_table, digits = 2)

# Omitting the name of the argument is allowed and does not change the result.
scores_table <- round(scores_table, 2)
scores_table

# Do you think omitting the names of optional arguments is good practice? Why?
# Also note how on line 198 above, we first rounded every score in scores_table
# to two decimal places, creating a new table. Then we assigned this table to
# the variable scores_table, replacing the previous table.



##  ---------- Working with Real Data -----------------------------------------

# Now you have mastered the basics of R.
# But we really want to learn how to import data! So let us do that.

# We have a CSV file of the Atlantic Hurricane Database (HURDAT2) 1851-2021.
# The data is released by the National Hurricane Center (NHC) at NOAA.

# But how do we import this data so we can use it in R?



##  ---------- Working Directory ----------------------------------------------

# All relative file paths in R are relative to the current working directory,
# which might or might not be the location of the R script, depending on how
# RStudio was originally launched. If RStudio was launched by double-clicking
# on the R script or by right-clicking on the R script and then selecting
# Open With > RStudio, the default working directory will be the location of
# the R script. Otherwise the default working directory will either be your
# Documents directory (Windows) or your home directory (macOS and Linux).

# We can use getwd() and dir() to explore the current working directory.

getwd()     # The current location of the working directory.
dir()       # The files in the working directory.

# Your working directory should be the "intro-r-workshop" directory and it
# should contain the both the current script (intro-r.R) and the data file
# (atlantic.csv). You can use the %in% operator to ensure this is the case.

'atlantic.csv' %in% dir()

# If the statement above returns TRUE, you are all set. But if it returns
# FALSE, you need to change your working directory. The intro-r.R script and
# the atlantic.csv data file should have been downloaded to the same location.
# Ensure that that they are both right next to each other in the same folder
# and then set the working directory to the folder containing your script via
# Session > Set Working Directory > To Source File Location.

# We can ensure the working directory is set correctly by either re-running the
# commands from above or clicking on the Files tab in the lower-right panel and
# then selecting More > Go To Working Directory and exploring the results.



##  ---------- Base R and the Tidyverse ---------------------------------------

# Thus far we have been working with what is called base R, that is R without
# any community-developed packages installed. Base R has a lot of built-in
# functionality and can easily do most things. For example, there is a function
# called read.csv() that can be used to read comma-delimited data files.

hurrdata <- read.csv('atlantic.csv')

# However, that built-in function is notoriously inefficient and slow when
# reading larger files. Hence most data scientists use the read_csv() function
# (note the underscore) from the readr package instead. It provides the same
# functionality but is significantly faster and much more efficient.

# The readr package is a part of the tidyverse - a popular collection of R
# packages designed for data science. You will often see tidyverse packages
# used in online examples and it is highly recommended you use them in your
# work instead of relying solely on base R.

# Once you are more comfortable with R, you might also want to check out the
# "rio" package. It can import, export, and convert a wide array of various
# formats, like SPSS, Stata, and MATLAB data formats and even ZIP files!



##  ---------- Checking Installed Packages ------------------------------------

# Depending on what system you are running this script on, you might already
# have tidyverse installed. This can be easily verified using the Packages tab
# to the right. Click on the Packages tab to view a list of installed packages.
# There is also a search bar that allows you to search for a specific package.
# Try searching for tidyverse to check whether you have it installed or not.

# Alternatively we could use the installed.packages() function to see which
# packages are installed on our system. That function outputs a list of all
# installed packages. Using the %in% operator from before, we can check whether
# tidyverse appears in the list of installed packages or not.

'tidyverse' %in% installed.packages()

# This will return TRUE if you have tidyverse installed and FALSE if you do not.



##  ---------- Installing Packages --------------------------------------------

# We can install new packages using the install.packages() function. However,
# this function does not check if a package is already installed and will
# overwrite and re-install the specified package if it is already installed.

# Hence you should only use install.packages() to install packages you do not
# already have installed or to update previously installed packages if needed.

# The code block below first checks whether the tidyverse is installed or not.
# If it is installed, a message stating so is displayed. Otherwise the function
# install.packages() is called to install all of the packages in the tidyverse.
# Note that the installation process could take several minutes to complete.

if ('tidyverse' %in% installed.packages()) {
    message('Tidyverse already installed!')
} else {
  install.packages('tidyverse')
}

# You only need to install packages on your machine once. The next time you use
# R on your computer, all of the tidyverse packages will already be installed.

# You can also install packages via the Packages tab by clicking "Install".



##  ---------- Calling a Library ----------------------------------------------

# Before we can use a package, we need to add it to our library. This can be
# done using the library() command. Using the tidyverse meta-package, we can
# easily add all of the tidyverse packages into our library at once.

library(tidyverse)

# Note how multiple different packages were attached to our library.
# Also note how there were a couple conflicts. We will talk about those later.

# If you received an error stating that there is no package called 'tidyverse'
# please follow the instructions in the previous section to install the package.

# You can also include a package in your library by checking the box next to
# the corresponding package in the Packages tab.



##  ---------- Importing Data -------------------------------------------------

# When we called library(tidyverse), it included all of the tidyverse packages,
# including readr into our library and made them available for use.
# Now we can use the read_csv() function included in readr.

# However, remember that there were some conflicts. That means that some of the
# packages in our library now have functions with the same name. One of those
# functions masks the other one and gets called by default. If we want to make
# sure we are calling a specific function from a specific package, we should
# use the package::function() notation.

hurrdata <- readr::read_csv('atlantic.csv')

# However, if you check the conflicts that library(tidyverse) warned us about,
# we can see that read_csv is not included in that list. Hence we do not have
# to specify the package and can call it as we would any other function.

hurrdata <- read_csv('atlantic.csv')

# The read_csv() function has numerous additional optional arguments that we
# can use to specify how exactly a data file should be read in and interpreted.
# To investigate those, we can use the help() function or the ? operator.

?read_csv



##  ---------- Exploring Data -------------------------------------------------

# We see that a new variable 'hurrdata' has been added to the environment.

head(hurrdata)

# This shows us a preview of the fist couple rows of the file.
# We can also use summary() to get descriptive statistics.

summary(hurrdata)

# You can also click on the dataset under Environment > Data.

# We might wonder - what type of data is hurrdata?
# We imported it from csv, but how is it stored?

class(hurrdata)

# We can see that it is a "data.frame" and a "tbl" (table). A data frame is a
# table where you have observations as rows and variables as columns.
# Data frames have some great features for working with data and are the go-to
# for R data storage. You can think of them almost as Excel spreadsheets.



##  ---------- Working with Data Frames ---------------------------------------

# Let us say we want to access the maximum wind speed of the sixth observation.
# We can do this in multiple ways.
# Knowing that 'Maximum Wind' is the ninth column:

hurrdata[[6, 9]]    # [[row, column]]
hurrdata[[9]][6]    # [[column]][row]

# NOTE: When using a data frame, we must use [[]] to access variable values.
# [] will just give us a subset of the data frame, not the values themselves.

# Alternatively, we could use the column name:

hurrdata[['Maximum Wind']][6]
hurrdata$`Maximum Wind`[6]

# Note the dollar sign ($). This is a special operator that allows us to access
# data.frame variables (columns) based on their name.

# The '$' operator is the preferred way of accessing data.frame variables based
# on their name, as it removes the complexity of when to use [[]] vs [] and does
# not require quotation marks...

# ... given your column names are properly formatted.



##  --------- Data Cleaning: Column Names -------------------------------------

# Note how the column names contain spaces. This is bad practice as it
# requires you to type quotation marks or ticks when accessing a column,
# which is inconvenient and easy to miss, leading to errors. A lot of other
# programs do not support spaces in column names at all. Hence it is good
# data management practice to ensure your column names contain no spaces.

# It is common practice to replace spaces with periods or underscores instead.
# Luckily R contains a function that can do this for us.

# To get a list of all the column names, we can use ... names().

names(hurrdata)

# Now we can replace those with versions that contain no spaces.

make.names(names(hurrdata))

names(hurrdata) <- make.names(names(hurrdata))

# Now it is convenient access the maximum wind speed of the sixth observation.

hurrdata$Maximum.Wind[6]

# Note that more advanced R users would combine the read_csv() function from
# from readr with the clean_names() function from another package called
# janitor to read in the data and clean the column names all in one go.



##  ---------- Data Cleaning: Dates & Strings ---------------------------------

# Let us say we want to analyze maximum wind speed by year.
# Note how the date is stored as a number in YYYYMMDD format.
# This notation is great for sorting but very inconvenient for analysis.

# Extract the year and month and store them in separate columns as follows.

# Convert the dates to string (text) and extract to a variable.
date_strings <- as.character(hurrdata$Date)

# Extract the year from the date string (position 1-4).
hurrdata$Year <- substr(date_strings, start = 1, stop = 4)

# Extract the month from the date string (position 5-6).
hurrdata$Month <- substr(date_strings, 5, 6)

# Convert both new variables to numeric to accommodate further analysis.
hurrdata$Month <- as.numeric(hurrdata$Month)
hurrdata$Year <- as.numeric(hurrdata$Year)

# In reality you should actually use a package specifically deigned to work
# with dates like lubridate (also included in the tidyverse) and convert the
# "Date" variable into a date data type. But that would add extra complexity
# to this tutorial, so we decided to take a different approach here that also
# allowed us to experiment with type casting and the substr() function.



##  ---------- Making a Simple Scatter Plot -----------------------------------

# Let us say we would like to explore how the maximum wind speed of hurricanes
# has changed over time. A good visual tool to explore the relationship between
# two numerical variables is a scatter plot. We can use the built-in plot()
# function to create a quick and dirty scatter plot examining the relationship
# between time (denoted by the hurricane year) and hurricane maximum wind speed.

plot(hurrdata$Year, hurrdata$Maximum.Wind)

# Wow, this plot looks quite horrible! Let us try to improve on it by using the
# popular graphing library ggplot2 instead of the built-in plot() function.
# The ggplot2 library is included in the tidyverse and follows a layered logic.

# First you specify the data frame of interest using the ggplot() function and
# then you create a mapping between variables (columns) and axes using the
# aes() function. This defines the plotting environment and we can add layers
# to the plot using the + operator. For example, geom_point() will generate a
# point for each x and y combination as specified with ggplot() and aes().

# The plot object can be saved in a variable and then displayed by calling it.

hurrgraph <- ggplot(data = hurrdata, aes(x = Year, y = Maximum.Wind)) +
  geom_point()

hurrgraph

# That looks marginally better, but it is still quite awful. Feels like there
# might be something wrong with the data. Why are some wind speeds negative?

# While ggplot2 might appear to be more complicated to use than the built-in
# plot() function, it is actually much easier to create complex (and beautiful)
# data visualizations using ggplot2 than built-in graphing functionality.
# Many professionals also prefer ggplot2 and it is prevalent in various guides.



##  ---------- Subsetting and Cleaning Data -----------------------------------

# Remember those negative wind speeds? If we looked into the metadata, we would
# find that we should have removed these! We can check on the negative data:

min(hurrdata$Maximum.Wind)

# We can replace these by combining logical operators with [] to subset all the
# rows where the logical operator returns TRUE.

# Using this, we can find all the values less than zero (< 0) and replace them
# with "NA", which means "No Data" in R (like "." in Stata).

hurrdata$Maximum.Wind[hurrdata$Maximum.Wind < 0] <- NA

# We could also delete the whole observation, but this is bad practice!
# Let's check on the results. It should print "NA".

min(hurrdata$Maximum.Wind)

# To get the minimum wind speed excluding the NA values, we must call the min()
# function with na.rm = TRUE to instruct the function to ignore the NA values.

min(hurrdata$Maximum.Wind, na.rm = TRUE)



##  ---------- Sampling the Data ----------------------------------------------

# We can also sample the data.frame to declutter the scatter plot.
# For this, we will use the dplyr library included in the tidyverse.

# Note how I keep telling you that we are using different libraries, but
# because we installed and loaded all of the tidyverse, we do not need to worry
# about installing and loading these packages separately. In fact, if I were
# not mentioning it, we would not even notice we are using them.

hurrdata2 <- sample_n(hurrdata, 1000, replace = FALSE)



##  ----------- Customizing the Scatter Plot ----------------------------------

# Now we re-run the graph, and modify the axis to make the year easier to see.
# Highlight this entire section (lines 568-578) and click "Run".

hurrgraph2 <- ggplot(data = hurrdata2,
                     aes(x = Year, y = Maximum.Wind, color = Maximum.Wind)) +
  geom_point() + # add the initial points
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5)) +
  scale_color_gradient(low = 'blue', high = 'red') + # generate color scheme
  theme(legend.position = 'bottom') + # put the legend on the bottom
  ylab('Maximum Wind Speed (knots)') + # change the y-label
  ggtitle('Selected Annual Hurricane Data, 1851-2021') + # add a title
  theme(plot.title = element_text(lineheight = 0.8, face = 'bold')) # format

hurrgraph2



##  ---------- ADVANCED: Piping and Grouping ----------------------------------

# Was it correct of us to sample the data given our hypothesis?
# A closer look at it reveals that the data contains several entries for each
# hurricane at different points of intensity. Hence our approach was wrong.

# To see how the maximum wind speed of hurricanes has changed over time, we
# should be looking at the maximum wind speed of each hurricane at its highest
# point of intensity. We can use functions from dplyr to extract those.

library(magrittr)

hurrdata3 <- hurrdata %>%
  group_by(Name, Year) %>%
  summarize(Maximum.Wind = max(Maximum.Wind),
            .groups = 'drop')

# The pipe operator %>% from the magrittr library is often used to combine
# several functions into a data analysis pipeline. The pipeline above finds
# the maximum value of the Maximum.Wind column for each unique hurricane name
# and year combination. The pipe operator takes whatever is passed to it and
# feeds it into the next function as the first argument. Tidyverse functions
# are built to work with the pipe operator but other functions might not be.

# Now we can correctly visualize the change in maximum wind speed over time.

hurrgraph3 <- ggplot(data = hurrdata3, aes(x = Year, y = Maximum.Wind)) +
  geom_point() +
  geom_smooth(method = lm, formula = y ~ x) + # add a linear trend line
  ylab('Maximum Wind Speed (knots)') +
  ggtitle('Hurricane Wind Speeds at Highest Intnesity 1851-2021')

hurrgraph3



##  ---------- EXERCISE: Fix the Analysis -------------------------------------

# Do you think we made a good graph that tells an accurate story?
# Take a look at the year 1950. What do you think causes this sudden change?
# Is is fair to look at all the hurricanes from both before and after 1950?
# Should we instead be looking at the most intensive hurricane from each year?

# Fix the analysis above and produce a graph that answers the question:
#   How has the intensity of hurricanes changed over time?



##  ---------- OPTIONAL: Interactive Graphics ---------------------------------

# We can easily create interactive data visualization in R using the plotly
# package. Plotly is not included in the tidyverse, so we have to install it
# (unless it is already installed) and load it into our library.

# Keeping track of which packages you have installed could be quite tiresome
# and continuously re-installing packages is a waste of time. Luckily there are
# some R packages that make package management in R significantly easier.

# One of those packages is librarian. The shelf() command from the librarian
# package ensures that the package you want is loaded into your library and
# also installed if needed. This allows you to easily run the same script
# on different machines without having to worry about installing packages.
# But be warned that librarian does not display conflict warnings! Hence it
# is recommended to use the package::function() syntax when using librarian.

if (! 'librarian' %in% installed.packages()) {
    install.packages('librarian')
}

librarian::shelf(plotly)

hurrdata4 <- hurrdata %>%
  dplyr::group_by(Year) %>%
  dplyr::summarize(Count = dplyr::n_distinct(ID),
                   .groups = 'drop')

hurrgraph4 <- plotly::plot_ly(data = hurrdata4,
                              x = ~Year,
                              y = ~Count,
                              type = 'bar',
                              marker = base::list(
                                color = 'lightblue',
                                line = base::list(
                                  color = 'blue',
                                  width = 0.5))) %>%
  plotly::layout(title = 'Number of Hurricanes 1851 - 2021',
                 xaxis = base::list(title = 'Year', tickangle = 45),
                 yaxis = base::list(title = 'Recorded Number of Hurricanes'))

hurrgraph4



##  ---------- BONUS: Defining Functions --------------------------------------

# (Un)likely scenario: Suddenly you need to work with parametric equations.

# For those of you who do not know, a parametric equation is where the x and y
# coordinates are both written in terms of another variable.
# This variable is called a parameter and is usually denoted with the letter t.

# Let us say we were given the following parametric equation...
#   x = 16*sin(t)^3
#   y = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
# ...and asked to solve it for t ranging from 0 to 2*pi.

# We can easily define our parameter as follows.

t <- seq(0, 2 * pi, by = 0.1)

# However, calculating all the x and y values would be extremely tedious if we
# had to do it manually. Luckily we can use R to make our computer do it for us.
# All we need to do is just tell R how to calculate these values by defining
# functions that take t as input and return the value of either x or y.

# We can define the one for x as follows.

get_x <- function(t) {
  x = 16 * sin(t)^3
  return(x)
}

# Alternatively, we could also define it in one one line. We will do this for y.
# A one-line function like this is sometimes also called a lambda function.

get_y <- function(t) 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)

# Now we can easily store all of our t, x, and y values into a data frame

parameq <- data.frame(t = t)
parameq$x <- get_x(parameq$t)
parameq$y <- get_y(parameq$t)

# Finally, let us plot the results of our parametric equation.
# What do you think it will look like? Try to guess.

# Note that this whole section on parametric equations was added for a very
# special version of this workshop that ran on February 14. Does that help?

finalplot <- ggplot(data = parameq, aes(x = x, y = y)) +
  geom_polygon(linetype  = 'solid', size = 1.5, color = 'black', fill = 'red')

finalplot



## ----------- FAQ ------------------------------------------------------------

# You might wonder what is the difference between "=" and "<-"?
# Well, that is a good question and beyond the scope of this tutorial.
# But it is all about scope.

# When you create a variable, it is always within some area that limits from
# from where it is accessible, commonly called a scope.

# "<-" puts a value in the user's workspace, which makes it accessible by said
# user anywhere, whereas "=" declares it in the scope of a function.
