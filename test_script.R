add2  <- function(x,y){
  x+y
}

above  <- function(x, n=10) {
  use  <- x > n
  x[use]
  
}

colmean  <- function(x, rows="", removeNA=TRUE) {
  num_col  <- ncol(x)
  means  <- numeric(num_col)
  for(i in 1:num_col) {
    means[i] <- mean(x[rows,i], na.rm = removeNA )
  }
  means
}