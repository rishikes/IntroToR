source("complete.R")
corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  co <- complete(directory) # id and number of completely observed observations
  co.thresh <- co[co$nobs >= threshold,] #choose which satisfy the threshold
  
  result <- c()
  
  getcor <- function(id) {
    d<-getmonitor(id, directory)
    d <- d[complete.cases(d),]
    cor(d$sulfate,d$nitrate)
  }
  sapply(co.thresh$id, getcor)
  
  #for (id in co.thresh$id) {
   #  d <- getmonitor(id,directory)
    # d <- d[complete.cases(d),]
    # result <- c(result, cor(d$sulfate, d$nitrate))
  #}
  
  #result
}