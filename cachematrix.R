## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    # clear out the initial values 
    m <- NULL
    
    # define "set" 
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    # define "get"
    get <- function() {
        x
    }
    
    # define the "set" for the inverse
    setSolve <- function(inverse) {
        m <<- inverse
    }
    
    # define the "get" for the inverse
    getSolve <- function() {
        m
    }
    
    # return the list    
    list(set = set, get = get,
         setSolve = setSolve,
         getSolve = getSolve)
    #return a list of "set", "get", "setSolve", "getSolve"
}



## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    
    # get the inverse from the matrix frame
    m <- x$getSolve()
    ## if the inverse solution is already there. 
    ## Then return "getting cached data"
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    
    # if not solve the matrix to get the inverse
    data <- x$get()
    m <- solve(data)
    x$setSolve(m)
    m
}

#
# example
#

# a <- matrix(c(1, 3, 2, 4), ncol = 2)
# b <- makeCacheMatrix(a)
# cacheSolve(b)

