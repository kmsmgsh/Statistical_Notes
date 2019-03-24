set.seed(1)
#' Problem 1: pointwise sample is equivelent to the jump-point-wise Gaussian Process?
#' That is, sample is $x_1,x_2,...,x_n$ pointwise with start sample from $x_1$, then sample x_2 depend on x_1. Or jumpwise,
#' sample from $x_1,x_2$ , then jump $x_3$ depend on $x_1$, $x_4$ depend on $x_2$,...
#' Is this equivelent?
GPprior=function(xlim=c(-1,1))
{
  kernel=exp(x1-x2)
  x=seq(-1,1,0.01)
  f=x
  f[1]=r
  for (xi in x)
  {

  }

  }
kernel=function(x1,x2,l=1,sigma=1)
{
  return(sigma*exp(-abs(x1-x2)/l))
}
