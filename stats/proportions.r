confusion.matrix <- function(v) {
  dimnames <- list()
  matrix(v, nrow=2, dimnames=list("actual" = c("+","-"), "predicted" = c("+","-")))
}

proportion.model <- function(name,v) {
  confusion <- confusion.matrix(v)
  print(confusion)
  list(
    name = name,
    TP = v[1],
    TN = v[4],
    P = v[1] + v[3],
    N = v[2] + v[4]
  )
}

sens.test <- function(m1,m2) {
  print(paste(m1$name, "sensitivity:", (m1$TP/m1$P)))
  print(paste(m2$name, "sensitivity:", (m2$TP/m2$P)))
  print(prop.test(x = c(m1$TP, m2$TP), n = c(m1$P, m2$P)))
}

spec.test <- function(m1,m2) {
  print(paste(m1$name, "specificity:", (m1$TN/m1$N)))
  print(paste(m2$name, "specificity:", (m2$TN/m2$N)))
  prop.test(x = c(m1$TN, m2$TN), n = c(m1$N, m2$N))
}

baseline <- proportion.model("baseline",c(5,1,1,1))
#       predicted
# actual + -
#      + 5 1
#      - 1 1
eliminative <- proportion.model("eliminative",c(14,3,3,6))
#       predicted
# actual  + -
#      + 14 3
#      -  3 6
structural <- proportion.model("structural",c(24,5,3,9))
#       predicted
# actual  + -
#      + 24 3
#      -  5 9

sens.test(baseline, eliminative)
# baseline sensitivity: 0.833333333333333
# eliminative sensitivity: 0.823529411764706

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TP, m2$TP) out of c(m1$P, m2$P)
# X-squared = 2.2428e-31, df = 1, p-value = 1
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -0.3489446  0.3685524
# sample estimates:
#    prop 1    prop 2 
# 0.8333333 0.8235294 

sens.test(baseline, structural)
# baseline sensitivity: 0.833333333333333
# structural sensitivity: 0.888888888888889

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TP, m2$TP) out of c(m1$P, m2$P)
# X-squared = 3.7369e-31, df = 1, p-value = 1
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -0.4320077  0.3208966
# sample estimates:
#    prop 1    prop 2 
# 0.8333333 0.8888889 

sens.test(eliminative, structural)
# eliminative sensitivity: 0.823529411764706
# structural sensitivity: 0.888888888888889

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TP, m2$TP) out of c(m1$P, m2$P)
# X-squared = 0.026908, df = 1, p-value = 0.8697
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -0.3298345  0.1991156
# sample estimates:
#    prop 1    prop 2 
# 0.8235294 0.8888889 

spec.test(baseline, eliminative)
# baseline specificity: 0.5
# eliminative specificity: 0.666666666666667

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TN, m2$TN) out of c(m1$N, m2$N)
# X-squared = 3.504e-32, df = 1, p-value = 1
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -1.0000000  0.7583094
# sample estimates:
#    prop 1    prop 2 
# 0.5000000 0.6666667 

spec.test(baseline, structural)
# baseline specificity: 0.5
# structural specificity: 0.642857142857143

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TN, m2$TN) out of c(m1$N, m2$N)
# X-squared = 3.0052e-32, df = 1, p-value = 1
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -1.0000000  0.7370075
# sample estimates:
#    prop 1    prop 2 
# 0.5000000 0.6428571 

spec.test(eliminative, structural)
# eliminative specificity: 0.666666666666667
# structural specificity: 0.642857142857143

# 	2-sample test for equality of proportions with continuity correction

# data:  c(m1$TN, m2$TN) out of c(m1$N, m2$N)
# X-squared = 1.5498e-32, df = 1, p-value = 1
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -0.3973015  0.4449206
# sample estimates:
#    prop 1    prop 2 
# 0.6666667 0.6428571 