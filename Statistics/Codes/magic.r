stationary <- function(transition) {
  stopifnot(is.matrix(transition) &&
        nrow(transition)==ncol(transition) &&
            all(transition>=0 & transition<=1))
  p <- diag(nrow(transition)) - transition
  A <- rbind(t(p),
         rep(1, ncol(transition)))
  b <- c(rep(0, nrow(transition)),
         1)
  res <- qr.solve(A, b)
  names(res) <- paste0("state.", 1:nrow(transition))
  return(res)
}
stationary(matrix(c(0.7, 0.2, 0.1, 0.4, 0.6, 0, 0, 1, 0),
                  nrow=3, byrow=TRUE))