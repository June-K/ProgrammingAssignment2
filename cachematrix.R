## Coursera R-Programming course - Programming Assignment 2
## Lexical Scoping: caching the inverse of a matrix

## Create a matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    
    set <- function(y) {
        x <<- y
        i <<- NULL
    } 
    get <- function() x
    
    setInverse <- function(inv) i <<- inv
    getInverse <- function() i
    
    list(set = set,
         get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}


## Compute the inverse of the matrix returned by makeCacheMatrix
## If the inverse has already been calculated, retrieve it from the cache

cacheSolve <- function(x, ...) {
    i <- x$getInverse()
    
    if(!is.null(i)) {
        message("getting cashed data")
        return(i)
    }

    i <- solve(x$get(), ...)
    x$setInverse(i)
    i
}
