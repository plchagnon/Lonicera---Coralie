site=cbind(rep(c(0,1,0),c(0,10,40)),rep(c(0,1,0),c(10,10,30)),rep(c(0,1,0),c(20,10,20)),rep(c(0,1,0),c(30,10,10)),rep(c(0,1,0),c(40,10,0)))
colnames(site)=paste("site",1:5,sep="")
x=read.table("coralie.txt",header=F)
colnames(x)=c("pH","NH4","NO3","P","WSA","org")

x=cbind(site,x)


### Simulons un jeu avec 50 champignons, qui ont tous une affinité particulière pour les différents sites et propriétés de sol

n=50
coefs=matrix(nr=n,nc=ncol(x))
for(i in 1:n){coefs[i,]=rnorm(ncol(x),0,.5)}

y=as.matrix(x)%*%t(as.matrix(coefs))
xx=function(x){x+abs(min(x))}
y=apply(y,2,xx)
abunds=rlnorm(50,0,2)
metacom=y%*%diag(abunds)
metacom[metacom<5]<-0
metacom=metacom[,colSums(metacom)>0]
metacom=round(metacom)

save.image("fungal metacom.RData")

