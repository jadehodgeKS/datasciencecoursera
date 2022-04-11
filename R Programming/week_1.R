
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







