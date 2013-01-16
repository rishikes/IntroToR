source("getmonitor.R")
complete <- function(directory, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  theids <- c()
  nobs <- c()
  for (f in id) {
    idtable <- getmonitor(f,directory)
    theids <- c(theids,f) #add the id to the list
    nobs <- c(nobs, nrow(idtable[!(is.na(idtable$sulfate) | is.na(idtable$nitrate)),])) #add the number of rows to the list
  }
  data.frame(id=theids, nobs=nobs)
  
}