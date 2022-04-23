# define a contingency matrix 
mcnemar.matrix <- function(m1,m2,v) {
  dimnames <- list()
  dimnames[[m1]] <- c("+","-")
  dimnames[[m2]] <- c("+","-")
  matrix(v, nrow=2, dimnames=dimnames)
}

# print matrix and test results
mcnemar.print <- function(m1,m2,v) {
  contingency <- mcnemar.matrix(m1,m2,v)
  print(contingency) 
  mcnemar.test(contingency)
}

mcnemar.print("baseline", "eliminative", c(23,4,5,9))
  #         eliminative
  # baseline  + -
  #        + 23 5
  #        -  4 9

  # 	McNemar's Chi-squared test with continuity correction
  # McNemar's chi-squared = 0, df = 1, p-value = 1

mcnemar.print("baseline", "structural", c(24,3,5,9))
  #         structural
  # baseline  + -
  #        + 24 5
  #        -  3 9

  # 	McNemar's Chi-squared test with continuity correction
  # McNemar's chi-squared = 0.125, df = 1, p-value = 0.7237

mcnemar.print("eliminative", "structural", c(28,0,1,12))
  #            structural
  # eliminative  +  -
  #           + 28  1
  #           -  0 12

  # 	McNemar's Chi-squared test with continuity correction
  # McNemar's chi-squared = 0, df = 1, p-value = 1

mcnemar.print("structural", "reduced", c(29,0,4,8))
  #          reduced
  # structural  + -
  #         + 29 4
  #         -  0 8

  # 	McNemar's Chi-squared test with continuity correction
  # McNemar's chi-squared = 2.25, df = 1, p-value = 0.1336









# define a contingency matrix 
> mcnemar.matrix <- function(m1,m2,v) {
  dimnames <- list()
  dimnames[[m1]] <- c("+","-")
  dimnames[[m2]] <- c("+","-")
  matrix(v, nrow=2, dimnames=dimnames)
}

# print matrix and test results
> mcnemar.print <- function(m1,m2,v) {
  contingency <- mcnemar.matrix(m1,m2,v)
  print(contingency) 
  mcnemar.test(contingency)
}

> mcnemar.print("baseline", "eliminative", c(23,4,5,9))
        eliminative
baseline  + -
        + 23 5
        -  4 9

  McNemar's Chi-squared test with continuity correction
McNemar's chi-squared = 0, df = 1, p-value = 1

mcnemar.print("baseline", "structural", c(24,3,5,9))
        structural
baseline  + -
        + 24 5
        -  3 9

  McNemar's Chi-squared test with continuity correction
McNemar's chi-squared = 0.125, df = 1, p-value = 0.7237

mcnemar.print("eliminative", "structural", c(28,0,1,12))
            structural
eliminative  +  -
          + 28  1
          -  0 12

  McNemar's Chi-squared test with continuity correction
McNemar's chi-squared = 0, df = 1, p-value = 1

mcnemar.print("structural", "reduced", c(29,0,4,8))
          reduced
structural  + -
        + 29 4
        -  0 8

  McNemar's Chi-squared test with continuity correction
McNemar's chi-squared = 2.25, df = 1, p-value = 0.1336
