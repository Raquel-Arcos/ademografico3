##  para calcular Tabla de mortalidad  ####
tabmort <- function(m,edades,sex){
  
  mx <- m
  
  nax <- matrix(0.5,dim(mx)[1],dim(mx)[2])
  ## 1 MUJERES 2 HOMBRES
  if(sex==1){
    for(i in 1:dim(mx)[2]){
      if(mx[1,i]<0.01724){
        nax[1,i] <- 0.14903-2.05527*mx[1,i]
      }else if(mx[1,i]>=0.01724 & mx[1,i]<0.06891){
        nax[1,i] <- 0.04667+3.88089*mx[1,i]
      }else{nax[1,i] <- 0.31411}
    }
  }else{
    for(i in 1:dim(mx)[2]){
      if(mx[1,i]<0.023){
        nax[1,i] <- 0.14929-1.99545*mx[1,i]
      }else if(mx[1,i]>=0.023 & mx[1,i]<0.08307){
        nax[1,i] <- 0.02832+3.26021*mx[1,i]
      }else{nax[1,i] <- 0.29915}
    }
  }
  
  
  nax[edades,] <- 1/mx[edades,]
  
  qx<-matrix(1,dim(mx)[1],dim(mx)[2])
  
  for(i in 1:(dim(mx)[1])){
    qx[i,]<-mx[i,]/(1+(1-nax[i,])*mx[i,])
  }
  
  px <- 1-qx
  
  lx<-matrix(1,dim(mx)[1],dim(mx)[2])
  
  for(i in 2:dim(mx)[1]){
    lx[i,] <- lx[i-1,]*px[i-1,]
  }
  
  dx <- matrix(0,dim(mx)[1],dim(mx)[2])
  dx[dim(mx)[1],] <- lx[dim(mx)[1],]
  for(i in 1:(dim(mx)[1]-1)){
    dx[i,]<-lx[i,]-lx[i+1,]
  }
  
  
  Lx<-matrix(0,dim(mx)[1],dim(mx)[2])
  Lx[1,] <- dx[1,]/mx[1,]
  Lx[edades,] <- dx[edades,]/mx[edades,]
  for(i in 2:(edades-1)){
    Lx[i,]<-(lx[i,]+lx[i+1,])/2
  }
  
  Tx<-matrix(0,dim(mx)[1],dim(mx)[2])
  Tx[edades,]<-Lx[edades,]
  for(i in (edades-1):1){
    Tx[i,]<-Lx[i,]+Tx[i+1,]
  }
  
  ex <- Tx/lx
  
  Sx<-matrix(0,(dim(mx)[1]+1),dim(mx)[2])
  Sx[1,]<-Lx[1,]/lx[1,]
  Sx[(edades+1),] <- Tx[edades,]/Tx[(edades-1),]
  for(i in 2:edades){
    Sx[i,]<-Lx[i,]/Lx[i-1,]
  }
  
  tabmort <- list(Edad=c(0:(edades-1)),mx=mx, nax=nax, qx=qx, 
                  px=px, lx=lx, dx=dx, Lx=Lx, Tx=Tx, ex=ex, Sx=Sx)
}