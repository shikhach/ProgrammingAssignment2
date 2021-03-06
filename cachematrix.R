
# This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
	inverse <- NULL
		set <- function(y) {
			x <<- y
				inverse <<- NULL
		}
		get <- function() x
		setInverse <- function(inverse) inverse <<- inverse
		getInverse <- function() inverse
		list(set = set,
				get = get,
				setInverse = setInverse,
				getInverse = getInverse)


}

# `cacheSolve`: This function  calculates the inverse of matrix created by "makeCacheMatrix". 
#-     above. If the inverse has already been calculated (and the matrix has not changed), 
#-     then the `cachesolve` should retrieve the inverse from the cache.
# +    already been calculated (and the matrix has not changed), then
# +    `cacheSolve` should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
	inverse <- x$getInverse()
		if (!is.null(inverse)) {
			print("Retrieving data from cache from already computed Inverse matrix!!")
			return(inverse)
		}
	mat <- x$get()
	inverse <- solve(mat, ...)
	x$setInverse(inverse)
	inverse
	}
