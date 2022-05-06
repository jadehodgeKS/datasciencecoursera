
# Week 2 - R Programming Course

# Control Structures ------------------------------------------------------------

      # if, else: testing a condition
      # for: execute a loop a fixed number of times
      # while: execute a loop while a condition is true
      # repeat: execute an infinite loop
      # break: break the execution of a loop
      # next: skip an iteration of a loop
      # return: exit a function

# if, else ----------------------------------------------------------------------

## 1 condition
if(<condition>) {
    ## do something
}

## 2 conditions
if(<condition>) {
    ## do something
} else {
    ## do something else
}

# example
if(x > 3) {
  y <- 10
} else {
  y <- 0
}
# OR
y <- if(x > 3) {
  10
} else {
  0
}

## >=3 conditions
if(<condition1>) {
    ## do something
} else if(<conditoin2>) {
    ## do something different
} else {
    ## do something different
}

# for --------------------------------------------------------------------------

## Example
for(i in 1:10) {
  print(i)
}

## These 3 loops have the same behavior

x <- c("a", "b", "c", "d")

for(i in 1:4) {
  print(x[i])
}

for(i in seq_along(x)) {
  print(x[i])
}

for(letter in x) {
  print(letter)
}

for(i in 1:4) print(x[i])

## Nested for loops

x <- matrix(1:6, 2, 3)

for(i in seq_len(nrow(x))) {
        for(j in seq_len(ncol(x))) {
                print(x[i,j])
        }
}

# while -------------------------------------------------------------------------

count <- 0
while(count < 10) {
  print(count)
  count <- count + 1
}

## testing more than one condition
z <- while(z >= 3 && z <= 10) {
  print(z)
  coin <- rbinom(1, 1, 0.5)
  
  if(coin == 1) { ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}

# repeat ------------------------------------------------------------------------

x0 <- 1
tol <- 1e-8

repeat{
  x1 <- computeEstimate()   # Note 'computeEstimate' is not a real function
  
  if(abs(x1-x0) < tol) {
    break
  } else {
    x0 <- x1
  }
}


# next, return, break  --------------------------------------------------------------------------

for(i in 1:100) {
  if(i <= 20) {
    # Skip the first 20 iterations next
    next   # or return/break
  }
    # Do something here
}

# Functions --------------------------------------------------------------------------------------

## Examples
add2 <- function(x,y) {
  x + y
}
add2(3,5)

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n) {
  use <- x > n
  x[use]
}
x <- 1:20

columnmean <- function(y) {
  nc <- ncol(y)     # calculate number of columns
  means <- numeric(nc) # store means for each column
  for(i in 1:nc){
    means[i] <- mean(y[,i], na.rm = TRUE)
  }
  means
}
columnmean(airquality) # use na.rm=T in the mean or will receive NA

## formals function can show all arguments of a function
formals(read.table)
## function arguments have partial matching

## Defining a Function
f <- function(a, b = 1, c = 2, d = NULL) {
  
}

## Lazy Evaluation - arguments to a function are evaluated only as needed

## The "..." Argument indicates a variable number of arguments that are usually passed on to other functions
    ### necessary when the number of arguments passed to the function cannot be known in advance
    ### any arguments after ... have to be explicitely named

# Scoping Rules -----------------------------------------------------------------

## searching the global environment
search()

## R does Lexical Scoping
    ## This means the values of free variables are searched for in the environment in which the function was defined

## Use ls to see what environment a variable came from

ls(environment(add2))

# Coding Standards --------------------------------------------------------------

## 1. Write code in text editor and save with as a text format
## 2. Indent your code
## 3. Limit the width of your code (80 columns of text)
## 4. Limit the length of your functions (one activity per function)

# Dates and Times ----------------------------------------------------------------

## Dates stored as Date class (Number of days since 1970-01-01)

x <- as.Date("1907-01-01")
x
unclass(x)

## Times are represented by the POSIXct or the POSIXlt class (Number of seconds since 1970-01-01)
    ## POSIXct stores a very large integer
    ## POSIXlt stores a list with the date as well as other info like the day of the week, day of the year,
      ## month, day of the month

x <- Sys.time()
x
    # "2022-05-05 16:20:47 CDT"
p <- as.POSIXlt(x)
names(unclass(p))
p$sec

weekdays(p)   # gives day of the week
months(p)   # give the month name
quarters(p)  # gives the quarter "Q1", "Q2", etc.

datestring <- c("January 10, 2012 10:40", "December 9, 2011 9:10")
x <- strptime(datestring, "%B %d, %Y %H:%M")
x

?strptime  # Shows the format strings (%Y, %d, %B, etc.)

## Can't use operators on two different date classes


