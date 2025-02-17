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
# Or you could select the lines you wish to comment and press Ctrl/Cmd+Shift+C.
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
# You can also press Ctrl+Enter/Cmd+Return instead of clicking the "Run" button.

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

colnames(scores_table) <- c("Value")
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

# We have a CSV file of the Atlantic Hurricane Database (HURDAT2) 1851-2023.
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
# should contain both the current script (intro-r.R) and the data file
# (atlantic.csv). You can use the %in% operator to ensure this is the case.

"atlantic.csv" %in% dir()

# If the statement above returns TRUE, you are all set. But if it returns
# FALSE, you need to change your working directory. The intro-r.R script and
# the atlantic.csv data file should have been downloaded to the same location.
# Ensure that they are both right next to each other in the same folder and
# then set the working directory to the folder containing your script via
# Session > Set Working Directory > To Source File Location.

# We can ensure the working directory is set correctly by either re-running the
# commands from above or clicking on the Files tab in the lower-right panel and
# then selecting More > Go To Working Directory and exploring the results.



##  ---------- Importing Data -------------------------------------------------

# The atlantic.csv data file is in comma-separated values (CSV) format. (Note
# that the specifics of this format are outlined in standard RFC 4180.) This is
# a very common data format and you can easily import it in R as follows.

hurrdata <- read.csv("atlantic.csv")

# The read.csv() function has numerous additional optional arguments that we
# can use to specify how exactly a data file should be read in and interpreted.
# To investigate those, we can use the help() function or the ? operator.

?read.csv

# Note that CSV files are different from Excel spreadsheets (XLS or XLSX files)
# and R does not contain the functionality to import the latter by default.
# An external community-developed package must be used to import Excel files.
# Installing and loading external packages is discussed later in this script.



##  ---------- Exploring Data -------------------------------------------------

# We see that a new variable "hurrdata" has been added to the environment.

head(hurrdata)

# This shows us a preview of the fist couple rows of the file.
# You can also click on the data table under Environment > Data.

# We can use summary() to get descriptive statistics.

summary(hurrdata)

# We might wonder - what type of data is hurrdata?
# We imported it from csv, but how is it stored?

class(hurrdata)

# We can see that it is a "data.frame", commonly referred to as a data frame.
# A data frame is a table where you have observations as rows and variables as
# columns. Data frames have some great features for working with data and are
# the go-to for R data storage. You can think of them almost as spreadsheets.



##  ---------- Working with Data Frames ---------------------------------------

# Let us say we want to access the maximum wind speed of the sixth observation.
# We can do this in multiple ways.
# Knowing that "Maximum.Wind" is the ninth column:

hurrdata[[6, 9]]    # [[row, column]]
hurrdata[[9]][6]    # [[column]][row]

# NOTE: When using a data frame, we must use [[]] to access variable values.
# [] will just give us a subset of the data frame, not the values themselves.

# Alternatively, we could use the column name:

hurrdata[["Maximum.Wind"]][6]
hurrdata$Maximum.Wind[6]

# Note the dollar sign ($). This is a special operator that allows us to access
# data.frame variables (columns) based on their name.

# The "$" operator is the preferred way of accessing data.frame variables based
# on their name, as it removes the complexity of when to use [[]] vs [] and does
# not require quotation marks ... given your column names do not contain spaces.
# Note how the read.csv() function automatically replaced spaces with periods
# in the column names to accommodate this. Underscores are also an acceptable
# alternative to spaces and other functions might use those instead of periods.



##  ---------- Selecting Data Based on Conditions -----------------------------

# Note how the summary() function from before did not provide much information
# on the columns containing textual (character/string) data. These columns can
# be analyzed further using the table() function. Can you guess what it does?

table(hurrdata$Name)

# It creates a frequency table of all the unique values in the column!
# But what if we wanted to analyze hurricanes only with a specific name?

# We can select rows based on a condition by combining logical operators with []
# to subset all the rows where the logical operator returns TRUE. For example,
# all the hurricanes named Nicole can be extracted as follows.

hurrdata[hurrdata$Name == "NICOLE", ]

# Note that we leave the column index blank to select all the columns.

# Alternatively, we could extract values from one column based on the values of
# another column. For example, the maximum wind speed for all the hurricanes
# named Nicole could be obtained as follows.

max(hurrdata$Maximum.Wind[hurrdata$Name == "NICOLE"])



##  ---------- Data Cleaning: Dates & Strings ---------------------------------

# Let us say we want to analyze maximum wind speed by year.
# Note how the date is stored as a number in YYYYMMDD format.
# This notation is great for sorting but very inconvenient for analysis.

# We can use the "$" operator to easily extract the Data column as follows.

hurrdata$Date

# Passing this column to the as.character() function will convert all the
# numbers into text (character data). Note the quotes around the new values.

as.character(hurrdata$Date)

# Let us store these new character (string) representations of the dates in a
# new variable and use the substr() function to extract the year and the month.

date_strings <- as.character(hurrdata$Date)

# Extract the year from the date string (position 1-4).
hurrdata$Year <- substr(date_strings, start = 1, stop = 4)

# Extract the month from the date string (position 5-6).
hurrdata$Month <- substr(date_strings, 5, 6)

# Convert both new variables to numeric to accommodate further analysis.
hurrdata$Month <- as.numeric(hurrdata$Month)
hurrdata$Year <- as.numeric(hurrdata$Year)

# Note that this is a somewhat hack-y way of dealing with dates. It is suitable
# for simple conversions like this, but it is highly encouraged to use external
# packages specifically designed to work with dates for more complex tasks.



##  ---------- Making a Simple Scatter Plot -----------------------------------

# Let us say we would like to explore how the maximum wind speed of hurricanes
# has changed over time. A good visual tool to explore the relationship between
# two numerical variables is a scatter plot. We can use the built-in plot()
# function to create a quick and dirty scatter plot examining the relationship
# between time (denoted by the hurricane year) and hurricane maximum wind speed.

plot(hurrdata$Year, hurrdata$Maximum.Wind)

# Wow, this plot looks quite horrible! Let us try to improve on it...



##  ---------- Data Cleaning: Missing Data ------------------------------------

# Why are some wind speeds negative? If we looked into the metadata, we would
# find that we should have removed these! We can check on the negative data:

min(hurrdata$Maximum.Wind)

# We can combine [] with logical operators like before to find all the values
# less than zero (< 0) and replace them with "NA", which means "No Data" in R.

hurrdata$Maximum.Wind[hurrdata$Maximum.Wind < 0] <- NA

# We could also delete the whole observation, but this is bad practice!
# Let's check on the results. It should print "NA".

min(hurrdata$Maximum.Wind)

# To get the minimum wind speed excluding the NA values, we must call the min()
# function with na.rm = TRUE to instruct the function to ignore the NA values.

min(hurrdata$Maximum.Wind, na.rm = TRUE)



##  ---------- Sampling the Data ----------------------------------------------

# We can also sample the data.frame to de-clutter the scatter plot. This is a
# two-step process in base R. First we use the sample() function to randomly
# select a desired quantity of row indexes/numbers for our data frame.

sample(nrow(hurrdata), 1000)

# And then we use [] to extract those rows from the data frame.

hurrdata2 <- hurrdata[sample(nrow(hurrdata), 1000), ]



##  ----------- Customizing the Scatter Plot ----------------------------------

# We can now plot the sampled data and use various additional arguments to add
# a title, axis labels, and customize the visualization to our liking.

plot(x = hurrdata2$Year,
     y = hurrdata2$Maximum.Wind,
     main = "Selected Annual Hurricane Data, 1851-2023",
     xlab = "Year",
     ylab = "Maximum Wind Speed (knots)",
     pch = 21,          # type of symbol to use (see ?points for options)
     col = "blue",      # symbol line color
     bg = "lightblue")  # symbol fill color

# We can also add a regression line by combining the abline() function with the
# linear model function. Note the special syntax used to define the formula.

abline(reg = lm(formula = Maximum.Wind ~ Year, data = hurrdata2),
       col = "red",     # line color
       lty = "dashed",  # line type
       lwd = 3)         # line width



##  ---------- Base R and the Tidyverse ---------------------------------------

# Thus far we have been working with what is called base R, that is R without
# any community-developed packages installed. Base R has a lot of built-in
# functionality and can easily do most things, but you may have noticed how
# some of the code has been a little clunky. Community-developed packages often
# provide alternative functions that produce the same result using less or more
# streamlined code and add new functions that do things base R simply cannot.

# The most popular collection of R packages is called the Tidyverse, which is
# specifically designed for data science and often preferred by professionals.
# Tidyverse is a collection of several different packages, the following of
# which could be used to recreate our previous analysis using less code.

### readr is a package used for reading and writing tabular data
### lubridate is a package specifically designed to work with times and dates
### dplyr is a package that allows for easy modification of data frames
### ggplot2 is a streamlined and user-friendly data visualization package



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

"tidyverse" %in% installed.packages()

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

if ("tidyverse" %in% installed.packages()) {
  message("Tidyverse already installed!")
} else {
  install.packages("tidyverse")
}

# You only need to install packages on your machine once. The next time you use
# R on your computer, all of the tidyverse packages will already be installed.

# You can also install packages via the Packages tab by clicking "Install".



##  ---------- Calling a Library ----------------------------------------------

# Before we can use a package, we need to add it to our library. This can be
# done using the library() command. Using the tidyverse meta-package, we can
# easily add all of the tidyverse packages into our library at once.

library(tidyverse)

# Note how multiple different packages were attached to our library. Also note
# the reported conflicts. This means that some of the packages currently loaded
# into R have functions that share the same name. One of those functions masks
# the other one and gets called by default. To ensure a specific function from
# a specific package gets called, use the package::function() notation.

# If you received an error stating that there is no package called "tidyverse"
# please follow the instructions in the previous section to install the package.

# You can also include a package in your library by checking the box next to
# the corresponding package in the Packages tab.



##  ---------- ADVANCED: Package Management Using Librarian -------------------

# Keeping track of which packages you have installed could be quite tiresome
# and continuously re-installing packages is a waste of time. Luckily there are
# some R packages that make package management in R significantly easier.

# One of those packages is librarian. The shelf() command from the librarian
# package ensures that the package you want is loaded into your library and
# also installed if needed. This allows you to easily run the same script
# on different machines without having to worry about installing packages.
# But be warned that librarian does not display conflict warnings! Hence it
# is recommended to use the package::function() syntax when using librarian.

# Let us install librarian if it is not present and then use it to both install
# and load a package called janitor that is useful for data cleaning.

if (! "librarian" %in% installed.packages()) {
  install.packages("librarian")
}

librarian::shelf(janitor)



##  ---------- Rewriting the Analysis using Tidyverse -------------------------

# Now let us recreate our previous analysis using packages from the Tidyverse!
# First we use read_csv() from the readr package to import the CSV data file.

hurrdata3 <- readr::read_csv("atlantic.csv")

# The readr::read_csv() function is much faster than read.csv() from base R but
# it does not reformat the column names. Luckily we can use the clean_names()
# function from the janitor package to convert the column names to snake_case.

hurrdata3 <- janitor::clean_names(hurrdata3)

# The date column can be converted to a date format using lubridate functions.

lubridate::ymd(hurrdata3$date)

# Combining this with mutate() from dplyr allows for easy overwriting.

hurrdata3 <- dplyr::mutate(hurrdata3, date = lubridate::ymd(date))

# Now we can combine the mutate() function from dplyr with the lubridate year()
# and month() functions to easily create new columns for the year and month.

hurrdata3 <- dplyr::mutate(hurrdata3,
                           year = lubridate::year(date),
                           month = lubridate::month(date))

# Dplyr can also easily convert values to NA and sample rows from a table.

hurrdata3 <- dplyr::mutate(hurrdata3,
                           maximum_wind = dplyr::na_if(maximum_wind, -99))

hurrdata4 <- dplyr::sample_n(hurrdata3, 1000)



##  ---------- Alternate (Better) Data Visualizations -------------------------

# Now we can use the popular ggplot2 graphing library to visualize our data.
# The ggplot2 library is included in the tidyverse and follows a layered logic.

# First you specify the data frame of interest using the ggplot() function and
# then you create a mapping between variables (columns) and axes using the
# aes() function. This defines the plotting environment and we can add layers
# to the plot using the + operator. For example, geom_point() will generate a
# point for each x and y combination as specified with ggplot() and aes().

# The plot object can be saved in a variable and then displayed by calling it.

hurrgraph <- ggplot(data = hurrdata4, aes(x = year, y = maximum_wind)) +
  geom_point()

hurrgraph

# Note how the default plot looks slightly better than what the plot() function
# produces, but it is still quite bad. Luckily ggplot2 provides us with several
# customization options and we can tailor the visualization to our needs.

hurrgraph2 <- ggplot(data = hurrdata4,
                     aes(x = year, y = maximum_wind, color = maximum_wind)) +
  geom_point() + # add the initial points
  scale_color_gradient(low = "blue", high = "red") + # generate color scheme
  theme(legend.position = "bottom") + # put the legend on the bottom
  ylab("Maximum Wind Speed (knots)") + # change the y-label
  ggtitle("Selected Annual Hurricane Data, 1851-2023") + # add a title
  theme(plot.title = element_text(lineheight = 0.8, face = "bold")) + # format
  theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 0.5))

hurrgraph2

# While ggplot2 might appear to be more complicated to use than the built-in
# plot() function, it is actually much easier to create complex (and beautiful)
# data visualizations using ggplot2 than built-in graphing functionality.
# Many professionals also prefer ggplot2 and it is prevalent in various guides.



##  ---------- ADVANCED: Piping and Grouping ----------------------------------

# Was it correct of us to sample the data given our hypothesis?
# A closer look at it reveals that the data contains several entries for each
# hurricane at different points of intensity. Hence our approach was wrong.

# To see how the maximum wind speed of hurricanes has changed over time, we
# should be looking at the maximum wind speed of each hurricane at its highest
# point of intensity. We can use functions from dplyr to extract those.

hurrdata5 <- hurrdata3 %>%
  dplyr::group_by(name, year) %>%
  dplyr::summarize(maximum_wind = max(maximum_wind),
                   .groups = "drop")

# The pipe operator %>% from the magrittr library is often used to combine
# several functions into a data analysis pipeline. The pipeline above finds
# the maximum value of the maximum_wind column for each unique hurricane name
# and year combination. The pipe operator takes whatever is passed to it and
# feeds it into the next function as the first argument. Tidyverse functions
# are built to work with the pipe operator but other functions might not be.

# Now we can correctly visualize the change in maximum wind speed over time.

hurrgraph3 <- ggplot(data = hurrdata5, aes(x = year, y = maximum_wind)) +
  geom_point() +
  geom_smooth(method = lm, formula = y ~ x) + # add a linear trend line
  ylab("Maximum Wind Speed (knots)") +
  ggtitle("Hurricane Wind Speeds at Highest Intensity 1851-2023")

hurrgraph3



##  ---------- EXERCISE: Fix the Analysis -------------------------------------

# Do you think we made a good graph that tells an accurate story?
# Take a look at the year 1950. What do you think causes this sudden change?
# Are we correctly extracting the maximum wind speed for each unique hurricane?
# Is it fair to be comparing all the recorded hurricanes from 1850 until 2023?
# Should we instead be looking at the most intensive hurricane from each year?

# Fix the analysis above and produce a graph that answers the question:
#   How has the intensity of hurricanes changed over time?



##  ---------- OPTIONAL: Interactive Graphics ---------------------------------

# We can easily create interactive data visualization in R using the plotly
# package. Plotly is not included in the tidyverse, so we have to install it
# (unless it is already installed) and load it into our library. We can use
# the shelf() function from the librarian package to easily do this as before.

librarian::shelf(plotly)

hurrdata6 <- hurrdata3 %>%
  dplyr::group_by(year) %>%
  dplyr::summarize(count = dplyr::n_distinct(id),
                   .groups = "drop")

hurrgraph4 <- plotly::plot_ly(data = hurrdata6,
                              x = ~year,
                              y = ~count,
                              type = "bar",
                              marker = base::list(
                                color = "lightblue",
                                line = base::list(
                                  color = "blue",
                                  width = 0.5))) %>%
  plotly::layout(title = "Number of Hurricanes 1851-2023",
                 xaxis = base::list(title = "Year", tickangle = 45),
                 yaxis = base::list(title = "Recorded Number of Hurricanes"))

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
  geom_polygon(linetype  = "solid",
               linewidth = 1.5,
               color = "black",
               fill = "red")

finalplot



## ----------- FAQ ------------------------------------------------------------

# You might wonder what is the difference between "=" and "<-"?
# Well, that is a good question and beyond the scope of this tutorial.
# But it is all about scope.

# When you create a variable, it is always within some area that limits from
# from where it is accessible, commonly called a scope.

# "<-" puts a value in the user's workspace, which makes it accessible by said
# user anywhere, whereas "=" declares it in the scope of a function.
