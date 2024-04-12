# Quiz 1 Solution
x <- c(7, 7, 9, 6, 55, 2) 
length(x) 
unique(x)  
sort(x)  
table(x) 



# Quiz 2 Solution
1:5
x1 <- array(1:5, c(1, 1, 5))
x1
x2 <- array(1:5, c(1, 5, 1))
x2
x3 <- array(1:5, c(5, 1, 1))
x3



# Quiz 3 Solution
A <- matrix(c(1, 2, 3, 4), ncol = 2, byrow = TRUE)
B <- matrix(c(5, 6, 7, 8), ncol = 2)
## dimensions
dim(A)
dim(B)
## determinants
det(A)
det(B)
## A+B
A + B
## AB
A %*% B
## A^{-1} and B^{-1}
solve(A)
solve(B)



# Quiz 4 Solution
my_function <- function(x, y) {
  return(y^x)
}
my_function(4,5)



# Quiz 5 Solution
x <- -9
if (x %% 2 == 0) { # '%%' indicates x mod y (“x modulo y”)
  print("divisible by 2")
} else if (x %% 3 == 0) {
  print("divisible by 3")
} else {
  print("not divisible by 2 nor by 3...")
}



# Quiz 6 Solution
library(Lahman)
data("Batting", package = "Lahman")

Batting[Batting$yearID == "1900", ]                 # 1900 data
length(unique(Batting$playerID))                    # number of players
length(unique(Batting$teamID))                      # number of teams
Batting1950 <- Batting[Batting$yearID == "1950", ]  # new dataframe for 1950
Batting1950



# Quiz 7 Solution
player25 <- Batting %>% filter(BB > 25 & yearID < 1900)
head(player25)

player25_ordered <- player25 %>% arrange(desc(BB))
head(player25_ordered)