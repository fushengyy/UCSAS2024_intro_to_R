# R Basics

## R as a Calculator
3+8
exp(3)
sqrt(15)

## Getting Help
help(mean)
?mean

## Assignment Operators
x <- 5
x
"Hello World!" -> y
y
z = 2022
z



# R Data Structure

## Data Types

### Logical
bool1 <- TRUE # or bool1 <- T
bool1
class(bool1)

bool2 <- FALSE # or bool2 <- F
bool2
class(bool2)

### Numeric
weight <- 63.5
weight
class(weight)

height <- 182
height
class(height)

### Integer
integer_variable <- 186L
integer_variable
class(integer_variable)

### Complex
complex_value <- 3 + 2i
complex_value
class(complex_value)

### Charactor
my_char <- 'A'
my_char
class(my_char)

fruit <- "Apple"
fruit
class(fruit)

## Data Structures

### Vector
X <- c(1.2, 3.5, 9.2, 7.7, 8.1)
X
X[2] # check the second element
X <- c(X, 22.3) # add elements
X
typeof(X) # check type

Y <- c(TRUE, TRUE, FALSE, FALSE)
Y
typeof(Y)

### List
empId = c(1, 2, 3, 4) # 1st attribute: employee IDs
empName = c("Debi", "Sandeep", "Subham", "Shiba") # 2nd attribute: employee names
numberOfEmp = 4 ## 3rd attribute: number of employees
empList = list(empId, empName, numberOfEmp) # make a list
empList
typeof(empList)
empList[[2]] # 2nd element of the list
empList[[2]][2] # 2nd element of the 2nd element of the list

### Dataframe
Name = c("Amiya", "Raj", "Asish")
Language = c("R", "Python", "Java")
Age = c(22, 25, 45)
df = data.frame(Name, Language, Age)
df
df[1,3] # Get the element on the first row and the third column
df[["Age"]] # Get values of the variable "Age"
df$Age

### Matrix
A = matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9), # Taking sequence of elements
  nrow = 3, ncol = 3, # No of rows and columns
  byrow = TRUE # By default matrices are in column-wise order                          
)
A
B = matrix(
  c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  nrow = 3, ncol = 3
)
B
dim(A) # check dimension of A

### Array
A = array(
  c(1, 2, 3, 4, 5, 6, 7, 8), # Taking sequence of elements
  dim = c(2, 2, 2) # Creating two rectangular matrices 
                   # each with two rows and two columns                      
)
A
B <- array(1:12, dim = c(2,3,2))
B


## Function
my_function <- function() { # create a function with the name my_function
  print("Hello World!")
}
my_function()

my_function <- function(fname, lname) {
  paste(fname, lname)
}
my_function("Peter", "Griffin")

my_function <- function(country = "Norway") {
  paste("I am from", country)
}
my_function() # will get the default value, which is Norway
my_function("USA")

my_function <- function(x) {
  return (5 * x)
}
my_function(5)

## Loop
for (i in 1:5) {
  print(i)
}

i=1
while(i <= 5){
  print(i)
  i = i + 1
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
x <- -3 # 5
if (x < 0) {
  print("x is a negative number")
}

x <- -3 # 5
if (x < 0) {
  print("x is a negative number")
} else {
  print ("x is either a positive number or zero")
}

x <- -3 # 0 5
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

## Dataframe
str(Batting) # Learn more about variables.
names(Batting) # Names of the dataset
head(Batting) # Display the first few rows of the dataset.
Batting[, 1:4] # Display the first 4 columns of the dataset.
Batting[1:4,] # Display the first 4 rows of the dataset.
Batting$playerID # Display values of the variable "playerID".
Batting[, c("playerID")]
Batting[1:10, c("playerID", "yearID")] # Display the first 10 elements of 
                                       # the variables "playerID" and "yearID".
Batting$CS_SO <- Batting$CS + Batting$SO # Create a new variable "CS\_SO" by 
                                         # adding up values of variables "CS" 
                                         # and "SO".
head(Batting)
Batting[, c("CS", "SO", "CS_SO")] # Display only "CS", "SO", and "CS_SO".


## Data Manipulation using dplyr
install.packages("dplyr")
library(dplyr)
data("Salaries", package = "Lahman")
head(Salaries)
str(Salaries)

salaries <- Salaries %>%
  select(playerID, yearID, teamID, salary) # remove league info from the dataset
head(salaries)

batting <- left_join(Batting, salaries, 
                     by = c("playerID", "yearID", "teamID"))
head(batting)

batting <- batting %>% arrange(playerID, yearID)
head(batting)


## Visualization Using ggplot2
install.packages("ggplot2")
library(ggplot2)


year_data <- batting %>% 
  filter(yearID == "2005")

ggplot(year_data, aes(x = X2B, y = HR)) +
  geom_point()

ggplot(year_data, aes(x = X2B, y = HR)) +
  geom_point() +
  labs(x = "Doubles", y = "Homeruns", 
       title = "Scatterplot: Homeruns vs. Doubles")

ggplot(year_data, aes(x = X2B, y = HR, color = lgID)) +
  geom_point() +
  labs(x = "Doubles", y = "Homeruns", 
       title = "Scatterplot: Homeruns vs. Doubles")