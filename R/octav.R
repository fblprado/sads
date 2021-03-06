octav <- function(x, oct, preston=FALSE){
  if(is(x, "fitsad"))
    y <- x@data$x
  else if(is(x,"fitrad"))
    y <- x@rad.tab$abund
  else if(is(x,"numeric"))
    y <- x[x>0]
  if(missing(oct)){
    oct <- 0:(ceiling(max(log2(y)))+1)
    if(any(y < 1)){
      octlower <- ceiling(min(log2((y)))):-1
      oct <- c(octlower, oct)
    }
  }
  else{
      if(min(oct)>min(log2(y))||max(oct)<max(log2(y))) stop(" 'oct' should include all abundance values in 'x' ")
      oct <- min(oct):max(oct)
  }
  N <- 2^(oct)
  oc.class <- cut(y, breaks=c(0, N), labels=oct)
  res <- as.data.frame(table(oc.class))
  res$upper <- N
  names(res)[1] <- "octave"
  if(preston){
    j <- N[-length(N)]
    w <- y[y%in%j]
    ties <- table(factor(w, levels=j))
    res[-1, 2] <- res[-1, 2]+ties/2
    res[-length(N), 2] <- res[-length(N), 2]-ties/2
  }
  new("octav", res[,c(1,3,2)])
}
