
# Week 1

# R console Input and Evaluation

x <- 1
print(x)

msg <- "hello"
print(msg)

# c is concatinate

x <- c(1, 3.2, 2.6, 5)
y <- 2:38
u <- c(0, 1.5, "j")
v <- c(TRUE, 7) # logical treated as a number, true = 1
w <- c("j", TRUE) # logical treated as a character, true = t

z <- vector("numeric", length = 20)

# Changing an objects class

x <- 0:6
as.character(x)
as.logical(x)

# Lists

x <- list(1, "a", TRUE)

# Matrices

m <- matrix(nrow = 5, ncol = 3)
dim(m)

# Factors

x <- factor(c("yes", "no", "yes"))
x <- factor(c("yes", "no", "yes"), 
            levels = c("yes", "no")) # makes yes the first level instead of default no

# Missing Values

# NAN used for undefined mathematical opperations, NA used for missing values 

x <- c(1, 4, NA, 0, 3)
is.na(x)

# Data Frames (tabular data, special type of list where each column has same length, not necessarily same class type)

x <- data.frame(num = 1:4, log = c(T, T, F, F))

# names attribute

names(x)

# Reading data

read.table(file = "yourtext.txt", header = TRUE, stringsAsFactors = TRUE)
read.csv()

# Reading Larger Data Sets ----------------------------------------------------

# Quick & Dirty way to figure out classes

data <- read.table("datatable.txt", nrows = 100)
classes <- sapply(data, class)
data_w_classes <- read.table("datatable.txt", 
                             colClasses = classes)

# Rough calculation of how much RAM dataset requires. Make sure it's < computer RAM

# Scenario: df w 1,500,000 rows and 120 columns, all numeric. How much memory?

x <- 1500000 * 120 * 8 #bytes/numeric
# = 1440000000 bytes
x/2^20
# = 1373.29 MB
# = 1.34 GB

# Text Format
dump()

# Subsetting - Basics -----------------------------------------------------------------

# [] - always returns object(s) of the same class as the original
# [[]] - used to extract elements of a list or data frame
# $ - used to extract elements of a list of data frame by name, similar to [[]]

x <- c("a", "b", "c", "c", "d", "a")
x[x > "b"]
x[1:3]
u <- x > "a"
u

x <- 1:100
x[38:45]
x[30]

# Extract multiple elements of a list use single brackets

x <- list(dee = 1:10, gee = .38, jay = "Jade")
x$dee
x[1]
x["dee"]

name <- "jay"
x[[name]] # computed index for 'jay'
x$name # element 'name' doesn't exist

x[[c(1, 3)]] # first object in the list, third element

# Subsetting matrix

x <- matrix(1:6, 2, 3)
x
x[1,2] # first row, second column
x[2,1] # second row, first column
x[1,] # first row
x[,2] # second column
x[1,,drop = FALSE] # produces a matrix

# Partial Matching

x <- list(aardvark = 1:5)
x$a # dollar sign does partial matching
x[["a"]] # double bracket does not do partial matching
x[["a", exact = FALSE]] # turns off exact matching

# Removing NA Values

x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

y <- c("a", "b", NA, "d", NA, "f")
good <- complete.cases(x,y)
x[good]
y[good]

# Using Air Quality Data
airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]

# Vectorized Opperations
x <- 1:4
y <- 6:9

x + y 
x > 2
x >= 2
x == 8
x * y
x / y

# Quiz ------------------------------------------------------------------------

x<-c(1,3,5)
y<-c(3,2,10)
z<-rbind(x,y) # creates 2x3 matrix

x <- list(2, "a", "b", TRUE)
class(x[[2]])

x<- 1:4
y<-2
x+y

x <- c(17,14,4,5,13,12,10)
x[x>=11] <- 4
x[x > 10] <- 4

# filepath <- "~/R/datasciencecoursera/R Programming/hw1_data.csv"
hw <- read.csv("R Programming/hw1_data.csv")
hw[1:2,]
nrow(hw)
hw[152:153,]
hw[47, "Ozone"]

nullozone <- is.na(hw$Ozone) # a logical vector
sum(nullozone) # Counts all the TRUE, since TRUE=1

mean(hw$Ozone, na.rm = TRUE) # removes null values to find mean

ot <- hw[(hw$Ozone > 31) & (hw$Temp > 90),]
mean(ot$Solar.R, na.rm = TRUE)

mt <- hw[hw$Month == 6,]
mean(mt$Temp, na.rm = TRUE)

maymax <- hw[hw$Month == 5,]
max(maymax$Ozone, na.rm = TRUE)

