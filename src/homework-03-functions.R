#V. feladat
#3. feladat

get_gender<-function(nev=comic_characters$name[1])
{
  index <- which(comic_characters$name==nev)
  uj_gsm <- strsplit(comic_characters$gsm, split=" ", fixed=TRUE)
  comic_characters$gsm <- lapply(uj_gsm, function(x) x[1])
  uj_s <- strsplit(comic_characters$sex, split=" ", fixed=TRUE)
  comic_characters$sex <- lapply(uj_s, function(x) x[1])
  if(length(index)>1)
  {
    
    comic_characters$ujoszlop[is.na(comic_characters$gsm)==FALSE] <- comic_characters$gsm[is.na(comic_characters$gsm)==FALSE]
    comic_characters$ujoszlop[is.na(comic_characters$gsm)==TRUE] <- comic_characters$sex[is.na(comic_characters$gsm)==TRUE]
    reszhalmaz <- comic_characters[comic_characters$name==nev, ]
    return(sapply(reszhalmaz$ujoszlop, function(x) x[]))
    
  }
  
  #uj_gsm <- strsplit(comic_characters$gsm, split=" ")
  #comic_characters$gsm <- lapply(uj_gsm, function(x) x[1])
  #uj_s <- strsplit(comic_characters$sex, split=" ")
  #comic_characters$sex <- lapply(uj_s, function(x) x[1])
  
  if(is.na(comic_characters$gsm[index])==TRUE)
  {
    
    return(sapply(comic_characters$sex[index], function(x) x[]))
  }
  else
  {
    
    return(sapply(comic_characters$gsm[index], function(x) x[]))
  }
}
#IV. feladat
#1. feladat részéhez
fixrnorm <- function(n, s=1) {
  x <- rnorm(n)  
  x <- s * x / sd(x)  
  return(x)
}