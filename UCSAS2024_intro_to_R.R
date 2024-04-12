# R Basics

## Getting Help
help(mean)
?mean



## R as a Calculator
3 + 8
exp(3)
sqrt(15)



## Assignment Operators
x <- 5
x
"Hello World!" -> y
y
z = 2024
z

x <- 1 + 1
x
1 + 1 -> x
x

1:10
mean(x = 1:10)
mean(x <- 1:10)

a = (1 + 2) * 3 / 4
a ^ 2
a %% 2                            # x %% y: modulus (x mod y)
a %/% 2                           # x %/% y: integer division



# R Data Structure

## Data Types

### Logical
is_active <- TRUE
has_passed <- FALSE

is_active
class(is_active)  # Check class

### Numeric
weight <- 63.5 # A floating-point number
height <- 182 # Also stored as numeric by default

height
class(height)

### Integer
count <- 5L  # An integer

count
class(count)

### Complex
complex_value <- 3 + 2i
complex_value
class(complex_value)

### Charactor
name <- "Alice"
sentence <- 'Hello, world!'

name
class(name)



## Data Structures

### Vector
numeric_vector <- c(1, 2, 3, 4, 5)  # Numeric vector
integer_vector <- c(1L, 6L, 10L)  # Integer vector (with `L` suffix)
character_vector <- c("a", "b", "c")  # Character vector
logical_vector <- c(TRUE, FALSE, TRUE)  # Logical vector

numeric_vector
typeof(numeric_vector)  # Check type

x <- 1:3                         # (1, 2, 3)
length(x)                        # 3
names(x) <- letters[x]           # add names to x: "a", "b", and "c"
y <- setNames(x, LETTERS[x])     # (1, 2, 3) with names "A", "B", and "C"
names(y)                         # "A", "B", and "C"
y["A"]                           # 1 with name "A"
head(y, 2)                       # (1, 2) with names "A", "B"
head(y, - 1)                     # the same with `head(y, 2)`
y[c("B", "C")] <- c(4, 6)        # y = (1, 4, 6) with names "A", "B", "C"
rev(y)                           # (4, 2, 1) with names "C", "B", and "A"
c("A", "B") %in% names(y)        # (TRUE, TRUE)
z <- rep(letters[x], x)          # z = ("a", "b", "b", "c", "c", "c")
paste0(z, 1:6)                   # "a1", "b2", "b3", "c4", "c5", and "c6"


### Matrices and Arrays
a <- matrix(LETTERS[1:6], nrow = 2)  # 2 x 3 matrix ("A"-"F" by columns)
dim(a)                               # (2, 3)
a[2]                                 # "B"
a[1, ]                               # the first row
a[, 2]                               # the second column
a[1, 1:2]                            # "A" and "C"
a[rbind(c(1, 3), c(2, 1), c(2, 2))]  # "E", "B", "D"
b <- array(1:12, c(2, 3, 2))         # 2(row) x 3(column) x 2(# of matrices) array
dim(b)                               # (2, 3, 2)


### Dataframes and Lists
dat <- data.frame(x = 1:3, y = c("a", "b", "c"))
dat$z <- as.character(dat$x + 10)
dat$fac_z <- factor(dat$z)
str(dat)

x <- list(1:3, "a", c(TRUE, FALSE, TRUE), c(2.3, 5.9))
names(x) <- c("foo", "bar", "alpha", "beta")
str(x)
y <- list(x, sum)
str(y)
y[[2]](1:10)

z <- list(list(list()))  # nested list
str(z)



## Function
my_function1 <- function() { # create a function with the name my_function
  print("Hello World!")
}
my_function1()

my_function2 <- function(fname, lname) {
  paste(fname, lname)
}
my_function2("Peter", "Griffin")

my_function3 <- function(country = "Norway") { # set default argument to 
                                              # country = "Norway"
  paste("I am from", country)
}
my_function3() # will get the default value, which is "Norway"
my_function3("USA") # replace the default value by "USA"

my_function4 <- function(x) {
  return (5 * x)
}
my_function4(5)



## Loop
for(i in 1:5) {
  print(paste("The current value of i is", i))
}

count <- 1
while(count <= 5) {
  print(paste("Count is", count))
  count <- count + 1  # Important to modify the condition variable to avoid 
                      # infinite loop
}

for (i in 1:5) {
  print(i + 1)
}

i=1
while(i <= 5){
  i = i + 1
  print(i)
}



## Condition
x <- -3
if (x < 0) {
  print("x is a negative number")
}

x <- -3
if (x < 0) {
  print("x is a negative number")
} else {
  print ("x is either a positive number or zero")
}

x <- -3
if (x < 0) {
  print("x is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}

for (i in 1:5) { # combime loop and condition
  if (i == 2) {
    print(i)
  } else {
    print("i is not 2")
  }
}



## Install and Load R Packages
install.packages("Lahman")
library(Lahman)



## Search and Read Datasets in a Package
data(package = "Lahman")
data("Batting", package = "Lahman")



## Data Manipulation using Base R
str(Batting)                              # Learn about variables
names(Batting)                            # Names of the dataset
head(Batting)                             # Display the dataset's first few rows
Batting[, 1:4]                            # Display the first 4 columns
Batting[1:4,]                             # Display the first 4 rows 
Batting$playerID                          # Display all rows of 'playerID'
Batting[, c("playerID")]
Batting[1:10, c("playerID", "yearID")]    # Display the first 10 elements of 
                                          # the variables "playerID" and "yearID"
Batting$CS_SO <- Batting$CS + Batting$SO  # Create a new variable "CS_SO" by 
                                          # adding up values of variables "CS" 
                                          # and "SO".
head(Batting)
Batting[, c("CS", "SO", "CS_SO")]         # Display only "CS", "SO", and "CS_SO"



## Data Manipulation using dplyr
install.packages("dplyr")
library(dplyr)

data("Salaries", package = "Lahman")
head(Salaries)
str(Salaries)

salaries <- Salaries %>%
  select(playerID, yearID, teamID, salary)  # subset with no league info
head(salaries)

batting <- left_join(Batting, salaries,     # Add salary info and batting data
                     by = c("playerID", "yearID", "teamID"))         
head(batting)

mean(batting$salary, na.rm = TRUE)          # average salary

batting <- batting %>% 
  arrange(playerID, yearID)                 # Rearrange orders of the dataset
head(batting)



## Visualization Using Base R

### Sample data
x <- 1:10
y <- x^2

### Create a scatter plot
plot(x, y, main = "Scatter Plot", xlab = "X-axis", ylab = "Y-axis", 
     col = "blue", pch = 19)

### Create a line plot
plot(x, y, type = "l", main = "Line Plot", xlab = "X-axis", ylab = "Y-axis", 
     col = "red")

### Generate random data
data <- rnorm(100)

### Create a histogram
hist(data, main = "Histogram", xlab = "Value", col = "green", border = "white")

### Sample data
categories <- c("A", "B", "C", "D")
values <- c(5, 10, 15, 20)

### Create a bar plot
barplot(values, names.arg = categories, main = "Bar Plot", ylab = "Frequency", 
        col = "cyan")

### Generate sample data
set.seed(10)
group1 <- rnorm(100)
group2 <- rnorm(100, mean = 5)

### Create a box plot
boxplot(group1, group2, main = "Box Plot", names = c("Group 1", "Group 2"), 
        col = "orange")



## Visualization Using ggplot2 (cont.)

install.packages("ggplot2")
library(ggplot2)

year_data <- batting %>% filter(yearID == "2005")
head(year_data)

plot(x = year_data$X2B, y = year_data$HR,     # base R
     xlab = "Doubles", ylab = "Homeruns",
     main = "Scatterplot: Homeruns vs. Doubles")

ggplot(year_data, aes(x = X2B, y = HR)) +     # ggplot2
  geom_point() # Scatterplot of Homeruns vs. Doubles in 2005

ggplot(year_data, aes(x = X2B, y = HR)) +
  geom_point() +
  labs(x = "Doubles", y = "Homeruns",         # Change label names and add title
       title = "Scatterplot: Homeruns vs. Doubles")
                                             

ggplot(year_data, aes(x = X2B, y = HR, color = lgID)) +
  geom_point() +
  labs(x = "Doubles", y = "Homeruns",         # Group by League (lgID)
       title = "Scatterplot: Homeruns vs. Doubles")

totalHR <- Batting %>%                        # Total home runs by year
  group_by(yearID) %>%
  summarise(HomeRuns = sum(as.numeric(HR), na.rm=TRUE),
            Games = sum(as.numeric(G), na.rm=TRUE))
head(totalHR)

totalHR %>% filter(yearID <= 1918) %>%        # HR by year, pre-1919
  ggplot(., aes(x = yearID, y = HomeRuns)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Home runs hit")

totalHR %>% filter(yearID <= 1918) %>%        # Take games into account
  ggplot(., aes(x = yearID, y = HomeRuns/Games)) +
  geom_line() +
  geom_point() +
  labs(x = "Year", y = "Home runs per game played")

ggplot(totalHR, aes(x = yearID, y = HomeRuns)) +    # HR for all years
  geom_point() +
  geom_path() +
  geom_smooth() +
  labs(x = "Year", y = "Home runs hit")

ggplot(totalHR, aes(x = yearID, y = HomeRuns/Games)) +   # HR per game
  geom_point() +
  geom_path() +
  geom_smooth(se = FALSE) +
  labs(x = "Year", y = "Home runs per game played")
