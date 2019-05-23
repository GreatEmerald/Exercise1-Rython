# Geoscripting 2020 
# Lesson 1, Exercise 1
# Leap year
# Tests
# 20/05/2019

# Load testing package
suppressWarnings(library('testthat'))
library('testthat')

# Source main.r
cat('Running main.R...\n')  
cat('Log of main.R:\n\n')
source('main.R')

cat('\nmain.R runs without interruption\n')

# Start tests
cat('\nChecking functions...\n')

# Test if required functions exist
fun_req <- c("is.leap")
fun_found <- c(lsf.str())

# If the required functions do not exists, stop testing
for (fun in fun_req){
  new_fun <- paste0("^", fun, "$")
  if (Vectorize(grepl, USE.NAMES = FALSE)(new_fun, fun_found) == FALSE){
    stop(paste0("No function found called ", fun, ". Aborting tests."))
  }
}

cat('\nRunning tests for is.leap...\n')

# Test the true leap years
passed_true <- 0
true_leap <- c(2000, 2040, 1808, 1904)

for (year in true_leap){
  if (class(is.leap(year)) != "logical"){
    warning(paste0("Logical output expected, got output of class ", class(year), " instead"))
  }
  else{
    if (is.leap(year) == TRUE){
      passed_true = passed_true + 1
    }
  }
}

cat(paste0("\n", passed_true,"/", length(true_leap), " true leap year tests passed\n"))

# Test the false leap years
passed_false <- 0
false_leap <- c(1906, 2002, 2105, 1800)

for (year in false_leap){
  if (class(is.leap(year)) != "logical"){
    warning(paste0("Logical output expected, got output of class ", class(year), " instead"))
  }
  else{
    if (is.leap(year) == FALSE){
      passed_false = passed_false + 1
    }
  }
}

cat(paste0("\n", passed_false,"/", length(false_leap), " false leap year tests passed\n"))

cat(paste0("\nTotal number of test passed:", passed_true + passed_false,"/", length(false_leap) + length(true_leap), "\n"))

cat('\nTesting warnings and error handling...\n')

# Error handling for non-numeric input
expect_error(is.leap(TRUE))
expect_error(is.leap('string'))

# Warning for years not on Gregorian calendar
expect_warning( is.leap(1400))
expect_warning( is.leap(1581))

cat("\nAll warnings and errors well-handled\n")
cat("\nDone testing\n")
