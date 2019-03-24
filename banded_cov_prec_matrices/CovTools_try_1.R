library(gamair)
library(CovTools)
library(ggcorrplot)
library(PDSCE)
#data(prostate)
#X=as.matrix(data.frame(prostate$intensity))
#Res=PreEst.banded3(X, upperK = floor(ncol(X)/2),
#               algorithm = "Bonferroni", alpha = 0.01)
#Res
#cov(X)
#corRes=cov2cor(Res$C)
#corrplot(corRes)


data = mvtnorm::rmvnorm(100, sigma=diag(100))
## compare different K
out1 <- PreEst.banded3(data, upperK=1)
out2 <- PreEst.banded3(data, upperK=3)
out3 <- PreEst.banded3(data, upperK=5)
## visualize
#par(mfrow=c(2,2), pty="s")
image(pracma::flipud(diag(10)),main="Original Precision")
image(pracma::flipud(out1$C), main="banded2::upperK=1")
image(pracma::flipud(out2$C), main="banded2::upperK=3")
image(pracma::flipud(out3$C), main="banded2::upperK=5")
ggcorrplot(out2$C)
ggcorrplot(sampleCov)
sampleCov=cov(data)
image(pracma::flipud(sampleCov))
ggcorrplot(sampleCov)
out1
outBai=PreEst.banded2(data,upperK=40)


out4=band.chol(data,k=3)
image(pracma::flipud(out4))
out5=band.chol.cv(data)
out5
out5=band.chol(data,k=0)
out1 <- PreEst.banded3(data, upperK=3)
image(pracma::flipud(out5))
out1$C
out4



Posdef <- function (n, ev = runif(n, 0, 10))
{
  Z <- matrix(ncol=n, rnorm(n^2))
  decomp <- qr(Z)
  Q <- qr.Q(decomp)
  R <- qr.R(decomp)
  d <- diag(R)
  ph <- d / abs(d)
  O <- Q %*% diag(ph)
  Z <- t(O) %*% diag(ev) %*% O
  return(Z)
}
pdmat <- Posdef(n=5, ev=1:5)

Bandit=function(pdmat,k)
{
  n=dim(pdmat)[1]
  for (i in 1:n)
  {
    for (j in 1:n) {
      if (abs(i-j)>k)
       pdmat[i,j]=0
        }
  }
  return (pdmat)
}
#test
#Bandit(pdmat,2)

data2Cov=Posdef(100)
data2bandCov=Bandit(data2Cov,4)
data2band = mvtnorm::rmvnorm(300, sigma=data2bandCov)
out1 <- PreEst.banded3(data2band, upperK=1)
out2 <- PreEst.banded3(data2band, upperK=5)
out3 <- PreEst.banded3(data2band, upperK=9)

out4=band.chol(data,k=4)

ggcorrplot(out1$C)
ggcorrplot(solve(out2$C))
ggcorrplot(out3$C)
ggcorrplot(out4)
out2$optk
out3$optk
ggcorrplot(cov(data2band))
ggcorrplot(data2bandCov)
ggcorrplot(solve(data2bandCov))
