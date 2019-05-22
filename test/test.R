# Geoscripting 2020 
# Lesson 1, Exercise 1
# Leap year
# Tests
# 20/05/2019


library('testthat')

# Source main.r
source('main.r')

# True leap years
expect_that( is.leap(1800), is_a('logical'))
expect_that( is.leap(2000), equals(TRUE))
expect_that( is.leap(2040), equals(TRUE))
expect_that( is.leap(1808), equals(TRUE))

# False leap years
expect_that( is.leap(1906), is_a('logical'))
expect_that( is.leap(2002), equals(FALSE))
expect_that( is.leap(2150), equals(FALSE))
expect_that( is.leap(1862), equals(FALSE))

# Error handling for non-numeric input
expect_that( is.leap('string'), throws_error('numeric'))
expect_that( is.leap(TRUE), throws_error('numeric'))
expect_that( is.leap(), throws_error())

# Warning for years not on Gregorian calendar
expect_that( is.leap(1400), gives_warning('[gG]regorian'))
expect_that( is.leap(1581), gives_warning('[gG]regorian'))
