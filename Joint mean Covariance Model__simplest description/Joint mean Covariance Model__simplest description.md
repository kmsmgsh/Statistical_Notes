# Basic Model Description of the JMCM

## Case considered: Longitudinal measurement data

i for different subjects or individuals
$$
y_i=(y_{i1},y_{i2},...y_{im_i}) (i=1,2,...,n)
$$
so it's total n subjects, measured at time $ t=(t_{i1},t_{i2},..,t_{im_i}) $ 

Model assumption

$y_i\sim N_{m_i}(\mu_i,\Sigma_i)$

- Modelling mean by: $\mu_i=X_i\beta$  $X_i$ is $m_i \times (p+1)$ , 1 for intercept : denoted by $\theta_1$
- Modelling Covariance matrix $\Sigma_i$ , denoted by $\theta_2$ 

#### Modelling Framework

$$
\hat { \theta } _ { n } = \arg \min _ { \theta \in \Theta } \{ - 2 l ( \theta ) \}
$$

where 
$$
- 2 l ( \theta ) = \sum _ { i = 1 } ^ { n } \log \left| \Sigma _ { i } \right| + \sum _ { i = 1 } ^ { n } \left( y _ { i } - \mu _ { i } \left( \theta _ { 1 } \right) \right) ^ { \top } \Sigma _ { i } ^ { - 1 } \left( \theta _ { 2 } \right) \left( y _ { i } - \mu _ { i } \left( \theta _ { 1 } \right) \right)
$$
Is the Normal log-likelihood function times -2.

Argmin solved by quasi_newton, BFGS... methods.



Now the Problem becomes to how to modelling $\theta_2$. :: MCD, ACD, HPC

Just slightly mentioned here

##### Pourhamadi's notation:  Cholesky Decomposition to precision matrix(inverse of covariance matrix)

$$
\Sigma_i^{-1}=T'D^{-2}T
$$

That is,
$$
\begin{align}
&\Sigma_i= (T'D^{-2}T)^{-1}= (T^{-1})' D^2 T^{-1}\\
&T'\Sigma_iT=D^2
\end{align}
$$
After the linear combination T (low-triangular) , the covariance matrix becomes diagonal D.

That is
$$
Ty_i\sim N(T\mu_i,T\Sigma_iT'=D^2)
$$

##### Bickel's notation, a little reparameterization

$$
\begin{aligned} \Sigma _ { p } & = ( I - A ) ^ { - 1 } D \left[ ( I - A ) ^ { - 1 } \right] ^ { T } \\ \Sigma _ { p } ^ { - 1 } & = ( I - A ) ^ { T } D ^ { - 1 } ( I - A ) \end{aligned}
$$

##### Confusing part: 

By Pourhamadi 1999, we have

- $\hat y _ { i j } = \mu _ { i j } + \sum _ { k = 1 } ^ { j - 1 } \phi _ { i j k } \left( y _ { i k } - \mu _ { i k } \right) + \epsilon _ { i j }$
- $\sigma^2_{ij}=var(y_{ij}-\hat y_{ij})$
  - $\zeta_{ij}=log\ \sigma^2_{ij}$ 

the diagonal part of $D^2$ denoted by $\sigma_{ij}^2$ ,$$\phi_{ijk}$$ is the entry of $T$.

This be a way of interpreting, however, it just "may" be considered as way of estimation? but not under such framework.

The framework is just back to the "MLE" search part.
$$
-2\ell =\sum_{i=1}^n log |T_i^{-1}D_i(T^{-1})'|+\sum_{i=1}^n r_i'T'_iD^{-1}_iT_ir_i
$$

#### Actuall modelling part:

$log \sigma^2_{i}=\zeta _{ij} = Z_{ij}^T\lambda$ 

$\phi_{ijk}=w_{ijk}^T \gamma$

$\mu_{i}=X_i\beta$

=> $\beta,\lambda,\gamma$ is independent of $i$ ? That is weird.

So this is something like: The covariance structure is global? Like ...No...not no

The $\sigma_i,\phi_i$ is individual-specific, however, $\beta$,$\gamma$,$\lambda$ is not. That means, the "Autoaugressive coefficient" and "variance" for reparameterized coefficient, is global. 

This is something like, lag-1 correlation, is deterministic, no individual-specify things. 

##### Not import the mixed effect???

Seems there is a point to do.

Kattle data model: Specify

Model fitting procedure:

```{r}
fit3 <- jmcm(weight | id | I(day / 14 + 1) ~ 1 | 1, data = cattleA, + triple = c(8, 2, 2), cov.method = "hpc")
```

From the data: 

weight is $Y$, id is for longitudinal used id specify

time for longitudinal  "I(day / 14 + 1)" should notice that this is some specify function for LDA analysis only, any can modify for more general cases.

$X$ is $\mathbb 1$, and Z is also $\mathbb 1$. However, should be noticed that, this is not actually 1, it's a polynomial for time t.

1 only present no other predictor here. Then the triple (8,2,2) controls degree of freedom for polynomial of t, that is, Actual X is

$X_i=(1,t,t^2,...,t^8)$ 

Similarly Z is 1 also means

$Z_i= (1,t,t^2 )$

And should be noticed that the $W$ is not user-specified, $W$ is built inside the program, that is 

```{r} 
 wijk = (ti[j]-ti[k])^(0:triple[3])
```

So this is only consider for such covariance modelling under longitudinal analysis and the covariance matrix is a function of time $t$ .


$$
\begin{cases}
\begin{aligned}
&log\ \sigma^2_{ti}= 
\begin{array}{ccc}
(1 & t &t^2\cdots &t^n)          
\end{array}
\left (
\begin{array}{ccc}
\lambda_0\\\lambda_1\\ \vdots\\ \lambda_n
\end{array}
\right )
\\
&\phi_{ijk}= 
\begin{array}{ccc}
(1 & t_j-t_k &(t_j-t_k)^2\cdots &(t_j-t_k)^n)          
\end{array}
\left (
\begin{array}{ccc}
\gamma_0\\ \gamma_1\\ \vdots\\ \gamma_n
\end{array}
\right )
\end{aligned}
\end{cases}
$$

>  However, a very interesting question here is what if the data is not a balanced data?
>
> Not find any clue about this yet.  Because if it is unbalanced, the ijk structure should appear difference???

One result for the Cattle Data from pourhamadi 2000
$$
\begin{array} { c } { \log \tilde { \sigma } _ { t } ^ { 2 } = 3 \cdot 37 - 1 \cdot 47 t + 0 \cdot 24 t ^ { 2 } - 0 \cdot 93 t ^ { 3 } + \varepsilon _ { t v } } \\ { \tilde { \phi } _ { t j } = 0 \cdot 18 - 1 \cdot 7 ( t - j ) + 1 \cdot 64 ( t - j ) ^ { 2 } - 1 \cdot 11 ( t - j ) ^ { 3 } + \varepsilon _ { t j c } } \end{array}
$$
And BIC used to choose (p,q,d) pairs for time dependent polynomial degree of freedom by Pan(2003).