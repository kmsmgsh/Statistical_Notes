$\epsilon_i \sim N(0,\Sigma_i)$ Models is $Y_i=X_i\beta+\epsilon_i$



In $\Sigma_i$ we got $\frac{n_i(n_i+1)}{2}$.

Put parisomonioins structure to the covariance structure.

The compound symmetry structure.

Exponential correlation structure

Deacrease with the time lag

How far the point is: $\sigma_{ijk}=\sigma^2 exp(-\phi|t_{ij}-t_{ik}|)$

AR(1)...

also we have arma model

...

Unstructured model.

Estimating $\beta,\sigma^2,\theta$ , $\theta$ is the parameters inside the covariance structure.

Look at maximize likelihood estimation witch is approached by the log-likelihood function. SOlve the equations.

We take a further look at the maximal likelihood estimation, it is okay, unbiased. But for 

THe covariance part is biased, the reason is we over use the parameter in the estimation.

Than we can use restricted likelihood 

that is, split the data into two parts

$Y^*=AY$ there is many A but, one way can be showed as

$A=I_n-X(X'X)^{-1}X$

$Var(Y^*)=AVar(Y)A'=\sigma^2AVA'$

A is rand reduced matrix: $rank(A)=N-p$, i.e. A is a singular matrix and so does $AVA'$ .we want estimate by make a transformation, 

$A=BB'$ B is a $N\times (N-p)$ swap the identity matrix.

After the transformation $Z=B'Y$ , the probability density function of Z is given by the particular form, that's not depend on beta any more, we got $\tilde \beta$ but it's only a notation. In other words, the probability density is not depend on the parameter $\beta$.

This is the content for Thursday.

THe idea REML it is actually improve vision of the maximize likelihood estimation.

After that transformation, the density $f(Z)$ takes into account

No matrix A involves as well. That means, it doesnot depend the specified choice of A.

That is, Wednesday's content



Consider two hypothesis:


$$
H_0: \theta\in\Omega_0\text{    }\ \ \ \ \ \ \ \ \ \ H_1: \theta\in \Omega_1/\Omega_0
$$
That is, the likelihood ratio test.

The likelihood test 

​	







