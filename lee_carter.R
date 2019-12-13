# Funcion de Lee Carter lc.svd

lc.svd <- function(m,edades,tiempo1,tiempo2,ln){
  if (ln == TRUE){
    lm <- log(m)
  } else{
    lm <- m
  }
  ax <- rowMeans(lm[,tiempo1:tiempo2])
  
  lm_a <- lm - ax
  
  d <- matrix(0, nr = min(edades,tiempo2),
              nc = min(edades,tiempo2))
  
  diag(d) <- svd(lm_a)$d
  
  kt <- (d%*%t(-svd(lm_a)$v))
  bx <- -svd(lm_a)$u
  
  lc.svd <- list(ax = ax, bx = bx, kt = kt, D=d)
  
}