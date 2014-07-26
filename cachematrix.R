##This is a function, borrowing heavily from the examplar, that calculates an inverse of a matrix. If this has already been done, the solution is cached and returned instead.

## The first function in effect produces the necessary functions to be called later and loads the matrix.

makeCacheMatrix <- function(x) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  ## List of four functions, to be called by cachesolve
  get <- function() x 
    ## To get the original matrix to be inverted
  setinverse <- function(solve) inverse <<- solve
    ## To set the calculated inverse.
  getinverse <- function() inverse
    ## Calculated inverses get passed here, to be called if needed.
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}

## To perform the matrix inversion, or to recover the cached inversion if already calculated.
cacheSolve <- function(x, ...) {
  inverse <- x$getinverse()
  if(!is.null(inverse)) {
    message("getting cached data")
    return(inverse)
        ##Looking for previous cached value of the inverse, and returns it if present.
  }
  data <- x$get()
  inverse <- solve(data, ...)
  x$setinverse(inverse)
  inverse
        ##Else the function takes the original matrix, calculates the inverse, and adds this value to the cache.
}
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}
