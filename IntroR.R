##
##  _______     __ _         _____        _          _           _
## |__   __|   / _| |       |  __ \      | |        | |         | |
##    | |_   _| |_| |_ ___  | |  | | __ _| |_ __ _  | |     __ _| |__
##    | | | | |  _| __/ __| | |  | |/ _` | __/ _` | | |    / _` | '_ \
##    | | |_| | | | |_\__ \ | |__| | (_| | || (_| | | |___| (_| | |_) |
##    |_|\__,_|_|  \__|___/ |_____/ \__,_|\__\__,_| |______\__,_|_.__/
##
##            Innovate. Analyze. Visualize. | datalab.tufts.edu
##
##  -------------------------------------------------------
##  Title:        Introduction to R and RStudio
##  Last update:  2020-10-14
##  Written by:   Uku-Kaspar Uustalu & Kyle Monahan
##  Contact:      datalab-support -AT- elist.tufts.edu
##  -------------------------------------------------------
##
##  Data Lab resources on R and statistics: go.tufts.edu/stats



##  ------------------- Getting Started -------------------
##
##  R is a statistical platform similar to Stata, SAS, and SPSS. This software
##  allows you to manipulate data, perform descriptive statistics, recode
##  variables, and bring in your own data. If you're reading this, you have
##  opened RStudio (the development environment for R) and you're on the way!
##
##  -------------------------------------------------------


##  We will walk through this document together in the workshop.


##  ------------------- Data Management -------------------

##  Although we aren't covering data management in this workshop, it is an
##  important part of any statistical analysis. Think about:

##  1. Folder structure. (Thesis Data > Chapter2 > Survey Data > Data.xlsx)
##  2. Size of data. (Is it a 3 GB text file or a 2 TB video file for NVivo?)
##  3. Security of data. (Are you safeguarding personally-identifiable info?)
##  4. How to split your analysis? (Select the variables you care about from
##     the larger dataset and work with those.)
##  5. Cleaning your data. (Confirm all the variable types are as expected.)
##  6. Adding labels to variables. (So when you open the file in two years you
##     remember what regre2v1 means.)
##  7. Never save over your raw data! (Always make a copy!)
##  8. The .R file (this) is a great way to document your analysis.
##     To save these, go to File > Save when you have an .R script open.
##  9. R project files (.Rproj) are a great way to save the RStudio settings
##     you might have changed during your analysis.
##     You can create a new R project file by going to File > New Project.
## 10. R Notebooks (.Rmd) are a convenient way of storing detailed research
##     notes along with your code. These can also be exported to PDF or HTML.
##     You can create a new notebook by going to File > New File > R Notebook.

##  -------------------------------------------------------

#################
## LET'S BEGIN ##
#################

##  ---------------------- Comments -----------------------

# You write a comment by adding a "#" to the start of a line in an R script.
# We won't be writing an R script, only running one, but the idea is the same.

# The text in GREEN (if you are using the default theme) is a comment.
# The script is like a do file from Stata, syntax from SPSS, or the SAS program.

# If you want to create a new script, just type Control + Shift + N.



##  ----------------- Assigning Variables -----------------

# The first thing we can do is assign a variable.
# This looks like an arrow placing a value into a variable.
# Like this: n <- 200.

# To assign the variable, we need to run the code below.
# One option is to just press the "Run" button in the upper-right.
# Doing so will automatically run the next line of runnable code.
# To specify a line of code to run, simply select it or place your cursor on it.
# You can also press Ctrl+Enter instead of clicking the "Run" Button.

# Go ahead and run the code below.
# Remember to run all lines or chunks of code as you walk though this script.

n <- 200

# Now if you call n, you'll see the console report its value.

n



##  ------------------- Console Window --------------------

# YOUR TURN: Try setting n <- 300 in the Console Window!
# It's just like line 91 above. After you're done, print n.

# If you can't see the Console Window, just click on the word "Console" below.

# Try typing N at the Console Window. What happens?
# The variable N is not found, because n is the name of the variable, not N.
# R is case-sensitive!



##  ---------------- Combining Variables ------------------

# What if you have multiple numbers to set as a variable?
# For example, what if we wanted to store the grades we got on exams?
# These include 94, 96, 72, and 92. (The third test was really hard.)



##  --------------------- Functions -----------------------

# We use the combine function, which is c(n, n, n, ... n)

grades <- c(94, 96, 72, 92)

# A function is called using parenthesis ().

# This assigns our grades to the variable "grades" in the Environment.
# If we call the variable:

grades

# We see the values are printed. This is called a vector.
# One can access the values within a vector by using the square braces [].

# To get the second grade, we use:

grades[2]

# Note that R is one-indexed. To get the first grade, we use [1], not [0].
# Also, note that the 0th grade is a '[1]' (e.g. [1] 94 96 72 92).
# This tells R something about the way the data is stored.



##  --------------------- Operators -----------------------

# To check if a vector contains an element, we can use the %in% operator.

96 %in% grades

# It returns TRUE if the vector contains the element...

100 %in% grades

# ...and FALSE if it does not. TRUE and FALSE are boolean datatypes, also known
# as logical datatypes in R. These are commonly used to denote binary variables.

# Most advanced operators in R are surrounded by percent-signs. But that is not
# always the case. For example, the operator for NOT is an exclamation point.

!(96 %in% grades)

# The parentheses above are not actually necessary, but they help with clarity.
# First we check whether 96 is in grades, and then we reverse the result.



##  --------------- Descriptive Statistics ----------------

# The best thing about having multiple values to work with is that we can
# calculate various statistics. Most statistical functions in R easily take
# a whole vector as input. Let's see what our final semester grade would be!

mean(grades)    # Mean
median(grades)  # Median
sd(grades)      # Standard deviation



##  ---------------- Running from History -----------------

# Take a look at the History list, on the tab to the right.
# This is where the past commands we run sit.
# If you double click one, it will auto fill in the Console below.

# Try to double-click on a history command, click on the console window,
# and press "Enter". You can even save the entire list for future use!



##  ------------------- The Environment -------------------

# Now click on Environment. We see two objects, labeled as Values.
# These include grades and n.

# If you ever forget objects and don't want to click on Environment,
# you can always call the function objects.

objects()

# Suddenly, we were able to retake a test. Great!
# Now we have to replace the value of 72 (the lowest grade) with our new grade
# of 85. We can assign the new value to the specific index we want to replace.

grades[3] <- 85



##  ------------------ Saving Variables -------------------

# Re-calculate grades given our retake and create new values to store them.
# In R you can store almost anything as a variable, and you should take
# advantage of that. Always save anything that you might need going forward.

g_mean <- mean(grades)
g_median <- median(grades)
g_sd <- sd(grades)

# To store the values, remember to assign them to variables.
# Now we can create a table, with a function called rbind:

grades_table <- rbind(Mean = as.numeric(g_mean),
                      Median = as.numeric(g_median),
                      SD = as.numeric(g_sd))
grades_table

# When creating the table, we save it as an object (grades_table). Like this,
# we can refer back to this table at any point later in the script.



##  --------------- Working with Real Data ----------------

# Now you have mastered the basics of R.
# But we really want to learn how to import data! So let's do that.

# We have a CSV file of the Atlantic hurricane database (HURDAT2).

# The data is released by the National Hurricane Center.
# The GitHub repository contains a link to the metadata for this dataset.

# But how do we import this data so we can use it in R?



##  -------------- Base R and the Tidyverse ---------------

# Thus far we have been working with what is called base R, that is R without
# any community-developed packages installed. Base R has a lot of built-in
# functionality and can easily do most things. For example, there is a function
# called read.csv that can be used to read files containing data in CSV format.

# However, that function was written decades ago and is no longer the best
# function for the job. It is notoriously inefficient and slow, especially
# when it comes to larger files. A good alternative is the read_csv function
# (note the underscore) from the readr package. It provides the same
# functionality but is significantly faster and much more efficient.

# The readr package is a part of the tidyverse - a popular collection of R
# packages designed for data science. You will often see tidyverse packages
# used in online examples and it is highly recommended you use them in your
# work instead of relying solely on base R.



##  ------------- Checking Installed Packages -------------

# Depending on what system you are running this script on, you might already
# have tidyverse installed. We can check this by using the installed.packages()
# function that outputs a table of all installed packages.

installed.packages()

# But manually going though that table and checking if we have a package
# installed is extremely tedious, especially if we have many packages installed.

# We can use the %in% operator from before to check for a specific package.

'tidyverse' %in% installed.packages()

# This will return TRUE if you have tidyverse installed and FALSE if you do not.

# You can also view, search for, install, and activate packages using the
# packages tab to in the lower-right quadrant of RStudio.



##  ----------------- Installing Packages -----------------

# We can install new packages using the install.packages() function. However,
# this function does not check if a package is already installed and will
# overwrite and reinstall the specified package if it is already installed.

# To ensure we only install the package if it is not already installed, we can
# place the install.packages() function into an if statement.

if (!('tidyverse' %in% installed.packages())) {
    install.packages('tidyverse')
}

# If statements can be confusing and are perhaps somewhat too advanced for an
# introductory workshop. Basically, the block above checks if 'tidyverse' exists
# in the list of installed packages, and installs it if it is not present.

# Go ahead and select the whole if-statement above (lines 298-300) and run it.
# If you already have tidyverse installed, nothing will happen. But if you do
# not, the install.packages('tidyverse') command will run and install every
# tidyverse packages onto your computer. This might take up to five minutes.

# Note that you only need to install packages once. The next time you will be
# running R on this computer, all tidyverse packages will already be installed.



##  ------------------ Calling a Library ------------------

# Before we can use a package, we need to add it to our library.
# How do we do this? Let's try library:

?library()

# Using the tidyverse pseudo-package, we can easily add all of the tidyverse
# packages into our library at once.

library(tidyverse)

# Note how multiple different packages were attached to our library.
# Also note how there were a couple conflicts. We will talk about those later.



##  ------------------ Working Directory ------------------

# But where is the file we want to import?
# We can use dir() and getwd() to find out.

getwd()     # The current location where R is looking for files

dir()       # The files in the working directory.

# If the list of files in your current working directory does not contain
# atlantic.csv, you will need to make sure you have downloaded it and set your
# working directory to be the folder containing the file. We can check this
# manually by inspecting the output of dir(), or we can use %in% again.

'atlantic.csv' %in% dir()

# If the statement above returns TRUE, you are all set. But if it returns FALSE,
# you need to change your working directory. The IntroR.R script and the
# atlantic.csv data file should have been downloaded to the same location.
# Be sure that they are both right next to each other in the same folder.

# If your IntroR.R script and the atlantic.csv data file are in the same folder,
# you can set the working directory to the folder containing your script via
# Set Session > Working Directory > To Source File Location.

# Alternatively, you can set the working directory to the folder containing the
# atlantic.csv data file via Session > Set Working Directory > Choose Directory.

# If you prefer to do this in the console, you can use the setwd() function.
# Use help() to figure out how to use the setwd() function.

help(setwd)

# Now we can check. Click on the Files tab on the right hand side of the page,
# and click More > Go To Working Directory. You should see the data file there.

# If we have the right working directory, we can import data.



##  -------------------- Importing Data -------------------

# When we called library(tidyverse), it included all of the tidyverse packages,
# including readr into our library and made them available for use. Now we can
# use the read_csv function included in readr.

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

# NOTE: If RStudio tells you "atlantic.csv does not exist" or "no such file or
#       directory" this means that it cannot find the file. RStudio looks for
#       files in your working directory. Be sure that atlantic.csv is available
#       in the same folder as the IntroR.R script, and go to:
#       Session > Set Working Directory > To Source File Location.
#       This tells RStudio to look for files in the same folder as the script.



##  -------------------- Exploring Data -------------------

# We see that a new variable 'hurrdata' has been added to the environment.

head(hurrdata)

# This shows us a preview of the fist couple rows of the file.
# We can also use summary() to get descriptive statistics.

summary(hurrdata)

# You can also click on the dataset under Environment > Data.

# We might wonder - what type of data is hurricane data?
# We imported it from csv, but how is it stored?

class(hurrdata)

# We can see that it is a "data.frame" and a "tbl" (table). A data frame is a
# table where you have observations as rows and variables as columns.
# Data frames have some great features for working with data and are the go-to
# for R data storage. You can think of them almost as Excel spreadsheets.



##  -------------- Working with Data Frames ---------------

# Let's say we want to access the maximum wind speed of the sixth observation.
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

# ... given your variable names are properly formatted.



##  ------------- Data Cleaning: Column Names -------------

# Note how the variable names contain spaces. This is bad practice as it
# requires you to type quotation marks when accessing a variable, which is
# inconvenient and easy to miss, leading to errors. A lot of other programs
# do not support spaces in variable names at all. Hence it is good data
# management practice to ensure your variable names contain no spaces.

# It is common practice to replace spaces with periods or underscores instead.
# Luckily R contains a function that can do this for us.

# To get a list of all the column names, we can use ... names().

names(hurrdata)

# Now we can replace those with versions that contain no spaces.

names(hurrdata) <- make.names(names(hurrdata))

# YOU TRY: Confirm that the variable names no longer contain spaces.
#          Use the head() or summary() functions in the console.
#          Or simply click on the dataset under Environment > Data.

# Now it is convenient access the maximum wind speed of the sixth observation.

hurrdata$Maximum.Wind[6]



##  ----------- Data Cleaning: Dates & Strings ------------

# Let's say we want to analyze maximum wind speed by year.
# Note how the date is stored as a string in YYYYMMDD format.
# This notation is great for sorting but very inconvenient for analysis.

# Extract year and month and store them in separate columns.

# Isolate the date string. Note how the as.character() is actually unnecessary.
date.s <- as.character(hurrdata$Date)

# Extract the year from the date string (position 1-4).
hurrdata$Year <- substr(date.s, 1, 4)

# Extract the month from the date string (position 5-6).
hurrdata$Month <- substr(date.s, 5, 6)

# Convert both new variables to numeric to accommodate further analysis.
hurrdata$Month <- as.numeric(as.character(hurrdata$Month))
hurrdata$Year <- as.numeric(as.character(hurrdata$Year))

# YOU TRY: Take a look at the new data using head() or the Environment tab.

# In reality you should actually use a package specifically deigned to work with
# dates like lubricate (also included in the tidyverse) and convert the "Date"
# variable into a date data type. However, that would add extra complexity to
# this tutorial, so we decided to take a different approach here that also
# allowed us to experiment with type casting and the substring() function.



##  ---------------- Making a Scatter Plot ----------------

# To make graphs, we will use the ggplot2 library included in the tidyverse.

# Let's say we want to look at how maximum wind speed has changed over time.
# We can access the specific column using the data.frame$column notation.

hurrgraph <- ggplot(data = hurrdata, aes(x = Year, y = Maximum.Wind)) +
    geom_point()

hurrgraph

# Wow, this doesn't look very good.



##  ------------ Subsetting and Cleaning Data -------------

# We see we have negative data. If we looked into the metadata, we would find
# that we should have removed these! We can check on the negative data:

min(hurrdata$Maximum.Wind)

# We can replace these by combining logical operators with [] to subset all the
# rows where the logical operator returns TRUE.

# Using this, we can find all the values less than zero (< 0) and replace them
# with "NA", which means "No Data" in R (like "." in Stata)

hurrdata$Maximum.Wind[hurrdata$Maximum.Wind < 0] <- NA

# We could also delete the whole observation, but this is bad practice!
# hurrdata <- hurrdata[hurrdata$Maximum.Wind<=0, ]

# Let's check on the results. It should print "NA".
min(hurrdata$Maximum.Wind)



##  ------------------ Sampling the Data ------------------

# We can also sample the data.frame so it doesn't take so long to load.
# For this, we will use the dplyr library included in the tidyverse.

# Note how I keep telling you that we are using different libraries, but
# because we installed and loaded all of the tidyverse, we do not need to worry
# about installing and loading these packages separately. In fact, if I were not
# mentioning it, we would not even notice we are using them.

hurrdata2 <- sample_n(hurrdata, 200, replace = TRUE)



##  ------------------ Advanced Graphing ------------------

# Now we re-run the graph, and modify the axis to make the Year easier to see.
# Highlight this entire section (lines 573-583) and click "Run".

hurrgraph2 <- ggplot(data = hurrdata2,
                     aes(x = Year, y = Maximum.Wind, color = Maximum.Wind)) +
    geom_point() + # add the initial points
    theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5)) +
    scale_color_gradient(low = 'blue', high = 'red') + # generate color scheme
    theme(legend.position = 'bottom')+ # put the legend on the bottom
    ylab('Maximum Wind (knots)')+ # change the y-label
    ggtitle('Selected Annual Hurricane Data, 1851 - 2015')+ # add a title
    theme(plot.title = element_text(lineheight = 0.8, face = "bold")) # format

hurrgraph2



##  ----------- OPTIONAL: Interactive Graphics ------------

# The benefit of R is you can control almost everything...
# ... and that's the drawback of R as well.
# Remember to reference Stack Overflow and the links I provided.

# For those who are looking for an interactive graph - try plotly.
# Plotly is not included in the tidyverse, so we have to install it (unless it
# is already installed) and load it into our library.

if (!('plotly' %in% installed.packages())) {
  install.packages("plotly")
}

library(plotly)

hurrgraph3 <- plot_ly(hurrdata2, x = ~Year, y = ~Maximum.Wind, type = 'bar',
                      marker = list(color = 'rgb(158,202,225)',
                                    line = list(color = 'blue',
                                                width = 0.5))) %>%
  layout(title = 'Selected Annual Hurricane Data, 1851 - 2015',
         xaxis = list(title = 'Year', tickangle = 40),
         yaxis = list(title = 'Maximum Reported Wind Speed (knots)'))

hurrgraph3



##  -------------- BONUS: Defining Functions --------------

# (Un)likely scenario: Suddenly you need to work with parametric equations.

# For those of you who do not know, a parametric equation is where the x and y
# coordinates are both written in terms of another variable.
# This variable is called a parameter and is usually denoted with the letter t.

# Let's say we were given the following parametric equation...
#   x = 16*sin(t)^3
#   y = 13*cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
# ...and asked to solve it for t ranging from 0 to 2*pi.

# We can easily define our parameter as follows.

t <- seq(0, 2 * pi, by = 0.1)

# However, calculating all the x and y values would be extremely tedious if we
# had to do it manually. Luckily, we can use R to make our computer do it for us.
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



## ------------------------- FAQ --------------------------

# You might wonder what is the difference between "=" and "<-"?
# Well, that is a good question and beyond the scope of this tutorial.
# But it is all about scope.

# When you create a variable, it is always within some area that limits from
# from where it is accessible, commonly called a scope.

# "<-" puts a value in the user's workspace, which makes it accessible by said
# user anywhere, whereas "=" declares it in the scope of a function.

# For more information on this topic:
# https://www.r-bloggers.com/assignment-operators-in-r-''-vs-'-'
