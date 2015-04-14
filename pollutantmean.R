pollutantmean  <- function(directory, pollutant, id = 1:332){
  datapath  <- list.files(directory)
  for (j in seq_along(id)){
    rawdata = read.csv(file = paste(directory, datapath[id[j]], sep="/"))
    data = rawdata[[pollutant]]
    data  <- data[!is.na(data)]
    
    if (j==1){
      dataset  <- data
    }
    else {
      dataset  <- c(dataset, data)
    }
    
    
  }
  #debugging code
  #print(dataset)
 
  mean <- mean(dataset)
  mean
}