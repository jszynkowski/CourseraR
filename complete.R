##complete.R

complete  <- function(directory, id=1:332){
  filepath  <- list.files(directory)
  report  <- data.frame(id=NA, nobs=NA)
  for (j in seq_along(id)) {
    rel_filepath  <- filepath[id[j]]
    data  <- read.csv(file = paste(directory, filepath[id[j]], sep="/"))
    complete  <- complete.cases(data)
    report[j,1] <- id[j]
    report[j,2] <- nrow(data[complete,])
  }
  report
}