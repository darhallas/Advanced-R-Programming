#========================================================
#
# Created by Darienne Hallas
#
#========================================================



#=======================================================
#
# Use various methods to calculate the factorial of a
# number
#
#=======================================================



install.packages("pacman")

library(pacman)

p_load(dplyr)
p_load(tidyverse)
p_load(purrr)
p_load(microbenchmark)
p_load(magrittr)



# a version that uses a loop to calculate the function
Factorial_loop <- function(n) {
    
    stopifnot(n >= 0)
    
    if (n == 0) {
        fact = 1
    } else {
        fact <- n
        for (i in (n-1):1) {
            fact <- fact * i
        }
    }
    return(fact)
}



# a version that uses the reduce function to calculate the factorial
Factorial_reduce <- function(n) {

    stopifnot(n >= 0)
    
    if (n == 0) {
        fact = 1
    } else {
        
        fact <- reduce(1:n, function(x, y) {
                        x*y
                    }
                    )
        
    }
    return(fact)
}



# a version that uses recursion to calculate the factorial
Factorial_func <- function(n) {
    
    stopifnot(n >= 0)
    
    if (n == 0) {
        fact = 1
    } else {
        fact <- n * Factorial_func(n-1)
    }
    return(fact)
}



# a version that uses memorisation to calculate the factorial
fact_tbl <- c(1, rep(NA,100))

Factorial_mem <- function(n) {
    
    stopifnot(n >= 0)
    
    if (!is.na(fact_tbl[n])) {
        fact_tbl[n]
    } else {
        fact_tbl[n] <<- n * Factorial_mem(n-1)
    }
    return(fact_tbl[n])
}



# compare the functions to each other
time_test_n <- function(n) {
    microbenchmark(Factorial_loop(n), Factorial_reduce(n), Factorial_func(n), Factorial_mem(n))
}

result <- map(1:100,time_test_n)

result
