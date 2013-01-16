getmonitor <- function(id, directory, summarize = FALSE) {
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  
  ## Your code here
  
  #get the csv filename
  padding <- if (id <10) {"00"} else if (id <100) {"0"} else ""
  id <- paste0(padding,id)
  filename <- paste(id,"csv", sep=".")
  
  #save the currentwd
  oldwd <- getwd()
  setwd(directory)
  result.data.frame <- read.csv(filename)
  if (summarize){
    print(summary(result.data.frame))
  }
  
  #restore the working directory
  setwd(oldwd)
  
  result.data.frame
  

}
