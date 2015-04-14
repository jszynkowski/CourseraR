corr  <- function(directory, threshold=0){
  #call complete() to get count of complete cases 
  completecount <- complete(directory)
   nstations <- nrow(completecount)
   suprathreshold <- vector(mode="logical", length=nstations)
   #loop over all stations
   for (j in seq(nstations)){
     #does the station meet the complete case threshold?
     if (completecount[[j,2]] >= threshold){
       suprathreshold[j] <- TRUE
     }
     else {
       suprathreshold[j] <- FALSE
     }  
  }
  #figure out which files are suprathreshold and store their IDs
  id <- completecount$id[which(suprathreshold==TRUE)]
  #get filepath for suprathreshold files
  filepath <- list.files(directory)[which(suprathreshold ==TRUE)]
  #loop over all suprathreshold files
  for (i in seq_along(filepath)){
    data  <- read.csv(file = paste(directory, filepath[i], sep="/"))
    nitrate <- data$nitrate[complete.cases(data)==TRUE]
    sulfate <- data$sulfate[complete.cases(data)==TRUE]
    report[i] <- cor(nitrate, sulfate)
  }
  #changing null output to match Coursera
  if (sum(suprathreshold)==0){
    report <- vector(mode="numeric", length=0)
    report
  }
  else{
    report
  }
}

