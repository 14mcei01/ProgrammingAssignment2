# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   cache the matrix
# * getInverse     get the cahced value (inverse of the matrix)

#Note:
# <<- operator which can be used to assign a value to an object in an environment(local) that is different from the current environment.(global)
# makeCacheMatrix function
makeCacheMatrix <- function( m = matrix() ) {
  
  ## Initialize the inverse property
  cache <- NULL
  
  ## Method to set the matrix
  setMatrix  <- function( matrix ) {
    x <<- matrix
    cache <<- NULL
  }
  
  ## Method the get the matrix
  getMatrix  <- function() {
    ## Return the matrix
    x
  }
  
  ## Method to set the inverse of the matrix
  cacheInverse   <- function(solve) {
    cache <<- solve
  }
  
  ## Method to get the inverse of the matrix
  getInverse <- function() {
    ## Return the inverse property
    cache
  }
  
  ## Return a list of the methods
  list(setMatrix  = setMatrix , getMatrix  = getMatrix ,
       cacheInverse   = cacheInverse,
       getInverse = getInverse)
}



# The following function calculates the inverse of a "special" matrix created with 
# makeCacheMatrix

cacheSolve <- function(y, ...) {
        # get the cached value
        inverse <- y$getInverse()
        # if a cached value exists return it
        if(!is.null(inverse)) {
                message("getting cached data")
                return(inverse)
        }
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # return the inverse
        inverse
}
