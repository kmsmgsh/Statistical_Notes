Notes on *Discrete Longitudinal Data Modeling with a Mean-Correlation Regression Approach*

Lack of suitable mutivariate joint distributions for discrete variables that incorporate with the correlation.



Maximizing the full likelihooe function constructed from copula representation can be computational infeasible--> Composite pairwise likelihood approach.



Copula usage: Gaussian copula:Formally:

A set of random variables $\boldsymbol{U}=\left(U_{1}, \dots, U_{d}\right)^{\mathrm{T}}$ follows a Gaussian copula model if their joint distribution is specified by
$$
F\left(u_{1}, \ldots, u_{d}\right)=P\left(U_{1} \leq u_{1}, \ldots, U_{d} \leq u_{d}\right)=\Phi_{d}\left(v_{1}, \ldots, v_{d} ; \mathbf{R}\right)
$$
$\Phi_d$ is the porbability distribution function of the d-dimensional standardised normal distribution with zero mean, $\mathbf R$ is the correlation matrix. 

$v_i=\Phi^{-1} (w_i)$ Where $w_i=P(U_i\leq u_i)$ is the marginal distribution of $U_i\leq i\leq d$.  

Other copulas, like t-copula can also be applied.

Notation: standard Longitudinal data format: $\mathbf{y}_{i}=\left(y_{i 1}, \ldots, y_{i m_{i}}\right)^{\mathrm{T}}$ , $m_i$ longitudinal measurements fr i-th subject, discrete response $y_{ij}$ is observed at time $t_{ij}$ .Consider $y_{i j} \in\{0,1,2, \ldots\}$ . and $\mathbf{t}_{i}=\left(t_{i 1}, \ldots, t_{i m_{i}}\right)^{\mathrm{T}}$ 

$\{ y_{ij},x_{ij},t_{ij} \}(i=1,...,n;j=1,...,m_i).$ For categorical responses, we assume that $y_{ij}$ follows exponential family distribution (so that GLMs can be used modelling marginally discrete responses.) 
$$
f(y)=c(y ; \varphi) \exp [\{y \theta-\psi(\theta)\} / \varphi]
$$
Since $\psi'(\theta)=E(Y):=\mu$.

canonical link function:
$$
(\psi')^{-1} (\mu)=g(\mu)
$$
Then the GLM marginally for each $y_{ij}$ as
$$
g(E(y_{ij}))=g(\mu_{ij})=x^T_{ij}\beta
$$
$\operatorname{var}(y)=\varphi \psi^{\prime \prime}(\theta)​$

Joint distribution of $y_i$ following the Gaussian copula representation
$$
F_{m_i}(y_i)=P(Y_{i1}\leq y_{i1},...,Y_{im_i}\leq y_{im_i})=\Phi_{m_i}(z_{i1},...,z_{im_i};\mathbf R_i)
$$
where $z_{ij}=\Phi^{-1}_1 \{F(y_{ij})\}$

This is, $F(y_{ij})$ is the probability of $Y_{i_1} \leq y_{i1}$ , it's in the probability space [0,1], $\Phi_1^{-1} \{F(y_{ij})\}$ make the value from probability space back to sample space. Then this is in continuous sample space, then use multivariate Normal distribution as the joint distribution.

In a special case when the responses are binary, the correlation between two observations is a monotone function of the corresponding element in $R_i$ .



The HPC insed in decomposite correlation coefficients $R_i$ .



... 



The description of HPC 



...

modelling angles by
$$
\omega_{i j k}=\pi / 2-\operatorname{atan}\left(\mathbf{w}_{i j k}^{\mathrm{T}} \boldsymbol{\gamma}\right)
$$
$\mathbf{w}_{ijk}\in \mathbb R^{q}$ is a covariate and $\mathbb \gamma$ is a $q\times 1$ unknown parameters.

Let $\boldsymbol{\theta}=\left(\boldsymbol{\beta}^{\mathrm{T}}, \boldsymbol{\gamma}^{\mathrm{T}}, \varphi^{\mathrm{T}}\right)$.  Then follow the framework upon, we can construct likelihood and estimate $\mathbb \theta$ by MLE.

Gaussian copula has continuous support on $\mathbb R^d$ while discrete response variable are defined only on discrete grid points.

Full likelihood:


$$
\begin{aligned} L(\boldsymbol{\theta}) &=\prod_{i=1}^{n} P\left(Y_{i 1}=y_{i 1}, \ldots, Y_{i m_{i}}=y_{i m_{i}}\right) \\ &=\prod_{i=1}^{n} P\left(y_{i 1}-1<Y_{i 1} \leq y_{i 1} \leq y_{i 1}, \ldots, y_{i m_{i}}-1<Y_{i m_{i}} \leq y_{i m_{i}}\right) \\ &=\prod_{i=1}^{n} \int \cdots \int_{\mathbf{Z}_{i}^{-}<\mathbf{u} \leq \mathbf{Z}_{i}} \phi_{m_{i}}\left(\mathbf{u} ; \mathbf{R}_{i}\right) d \mathbf{u} \end{aligned}
$$
积分形式应该来源于Gaussian copula的定义。

> Laplace 展开对u，精度可能不够，特别是binary
>
> 包括pairwise likelihood，需要满足一定条件才能逼近的好



This is hard to deal with, then the author use the composite likelihood by using pairwise likelihood.

Construct all pairwise likelihoods via bivariate copula as
$$
p L(\boldsymbol{\theta})=\prod_{i=1}^{n} \prod_{1 \leq j<k \leq m_{i}} \int_{z_{i j}^{-}}^{z_{i j}} \int_{z_{i k}^{-}}^{z_{i k}} \phi_{2}\left(\mathbf{u} ; \rho_{i j k}\right) d \mathbf{u}
$$
That is, using two-integral instead of $m_i$ integrals.

$\rho_{ijk}$ is specified by the HPC.

log pairwise likelihood function is
$$
p l(\boldsymbol{\theta})=\sum_{i=1}^{n} \sum_{1 \leq j<k \leq m_{i}} \log \int_{z_{i j}^{-}}^{z_{i j}} \int_{z_{i k}^{-}}^{z_{i k}} \phi_{2}\left(\mathbf{u} ; \rho_{i j k}\right) d \mathbf{u} :=\sum_{i=1}^{n} \sum_{1 \leq j<k \leq m_{i}} l_{i j k}(\theta)
$$
and the score function is 
$$
\mathbf{S}_{n}(\boldsymbol{\theta})=\frac{\partial p l}{\partial \boldsymbol{\theta}}=\sum_{i=1}^{n} \sum_{1 \leq j<k \leq m_{i}} \frac{\partial l_{i j k}}{\partial \boldsymbol{\theta}} :=\sum_{i=1}^{n} \mathbf{S}_{n i}(\boldsymbol{\theta})
$$
Employ modified Fisher scoring algorithm to maximize the pairwise likelihood function.





Song, et. al. 2009

## Joint Regression Analysis of Correlated Data Using Gaussian Copulas

Estimating equations (EE)-based approach. Join marginal models for correlated outcomes. Shortcomings associated with the EE method due to lack of fuly parametric model: 1. loss of estimation efficiency 2. the lack of procedures for model assessment and selection, 3. Difficulty of incorporating vector outcomes of mixed types. 

Burn injury data: $y_1=log(\textit{burn area}+1)$   $y_2$ 1 for death from burn injury and 0 for survival.

Normally people do two seperate regression model but the problem is $y_1$ and $y_2$ are not independent, it's joint. How to consider the correlation in these two marginal models?

Develop a unified and flexible likelihood framework to join various marginal models.

Use GLMs as marginal models. To join marginal GLMs, invoke Gaussian copulas as the link model, and the resulting joint regression model is refrred to as the vector GLM(VGLM).

VGLM for correlated discrete outcomes and correlated mixed outcomes. Comparisons to the moment-based EE approach. 

Jointly analyze vector data by the GLM approach multidimensional GLMs, or VGLMs, specify the conditional distribution of a vector response y given x as follows :
$$
f(\mathbf{y} | \mathbf{x} ; \boldsymbol{\beta}, \boldsymbol{\varphi}, \Gamma)=\delta\left(\mathbf{y}, \eta_{1}, \ldots, \eta_{m} ; \boldsymbol{\varphi}, \Gamma\right)
$$
Parametric link model $\delta(\cdot ;\varphi,\Gamma)​$ is parameterized by the vector of dispersion parameters $\boldsymbol  \varphi=(\varphi_1,...,\varphi_m)^T​$

The $\Gamma​$ characterizes the association among the components of $\mathbf y​$. 

This article consider a new class of parametric link models $\delta(\cdot)$ via multivariate distributions generated by Gaussian copulas.



Multivariate ED Family distribution

Cumulative distribution function of $ED(\mu_j,\varphi_j)$ denoted by $G_j(y_j;\mu_j,\varphi_j)$
$$
F(\mathbf{y} ; \boldsymbol{\mu}, \varphi, \Gamma)=C\left\{G_{1}\left(y_{1} ; \mu_{1}, \varphi_{1}\right), \ldots, G_{m}\left(y_{m} ; \mu_{m}, \varphi_{m}\right) | \Gamma\right\}
$$
$\boldsymbol \mu=(\mu_1,\cdots,\mu_m)^T​$ is the vector of m means,$\boldsymbol\varphi=(\varphi_1,...,\varphi_m)^T​$  is dispersion parameters, $C(\cdot)​$ is m-variate Gaussian copula with 
$$
\begin{aligned} C(\mathbf{u} | \Gamma) &=\Phi_{m}\left\{\Phi^{-1}\left(u_{1}\right), \ldots, \Phi^{-1}\left(u_{m}\right) | \Gamma\right\} \\ \mathbf{u} &=\left(u_{1}, \ldots, u_{m}\right)^{T} \in(0,1)^{m} \end{aligned}
$$
$\Gamma$ is Pearson correlation matrix. For non-Gaussian margins, $\Gamma$ becomes a pairwise non-linear association, van der Waerden coefficient, which is defined by
$$
\gamma_{i j}=\operatorname{corr}\left[\Phi^{-1}\left\{G_{i}\left(y_{i}\right)\right\}, \Phi^{-1}\left\{G_{j}\left(y_{j}\right)\right\}\right]
$$
For continuous marginal CDF, $\gamma_{ij}$ represents the linear correlation of two normal scores $\Phi^{-1}\left\{G_{t}\left(y_{t}\right)\right\}, t=i, j$ . For discrete cases, the equation still holds but interpretation would be different. For binary case with same joint probability mass function, then the $\gamma_{ij}​$ can be interpreted as the tetrachoric correlation. 

The density functions of MEDs with different marginal distribution, in continuous case, the MED can be expressed by 
$$
f(\mathbf{y} ; \boldsymbol{\mu}, \varphi, \Gamma)=c\left\{G_{1}\left(y_{1}\right), \ldots, G_{m}\left(y_{m}\right) | \Gamma\right\} \prod_{i=1}^{m} g_{i}\left(y_{i} ; \mu_{i}, \varphi_{i}\right)
$$
where $c(\cdot)$ is density of the copula $C( \cdot)$
$$
c(\mathbf{u} | \Gamma)=|\Gamma|^{-1 / 2} \exp \left\{\frac{1}{2} \mathbf{q}^{T}\left(I_{m}-\Gamma^{-1}\right) \mathbf{q}\right\}
$$
When all margins are discrete, the joint probability function of a discrete MED distribution with the form:
$$
\begin{aligned} f(\mathbf{y}) &=\mathrm{P}\left(Y_{1}=y_{1}, \ldots, Y_{m}=y_{m}\right) \\ &=\sum_{j_{1}=1}^{2} \cdots \sum_{j_{m}=1}^{2}(-1)^{j_{1}+\cdots+j_{m}} C\left(u_{1, j_{1}}, \ldots, u_{m, j_{m}} | \Gamma\right) \end{aligned}
$$
Another case is the mixed outcome.

3. Simultaneous Maximum Likelihood Inference

Responses $\left(\mathbf{y}_{1}, \ldots, \mathbf{y}_{n}\right)$ with covariates $\left(X_{1}, \ldots, X_{n}\right)$ follows m-variate MED distribution
$$
\mathbf{y}_{i}\left|X_{i}=\left(\mathbf{x}_{i 1}, \ldots, \mathbf{x}_{i m}\right) \sim \operatorname{MED}_{m}\left(\boldsymbol{\mu}_{i}, \boldsymbol{\varphi}_{i}, \Gamma\right), \quad i=1, \ldots, n\right.
$$
Responses $\bold y_i$ has mean $\bold \mu_i=\left(\mu_{i 1}\left(\mathbf{x}_{i 1}\right), \ldots, \mu_{i m}\left(\mathbf{x}_{i m}\right)\right)^{T}$ and dispersion $\varphi_{i}=\left(\varphi_{i 1}, \ldots, \varphi_{i m}\right)^{T}$ .

Mean $\mu_i$ follows marginal GLM $h_j(\mu_{ij})=\eta_j(x_{ij}) $  with $\eta_{i j}=\mathbf{x}_{i j}^{T} \boldsymbol{\beta}_{j}$

Let $\theta=(\beta,\varphi,\Gamma)$ . For normal longitudinal or clustered data analysis, VGLM with $\Gamma$ has some specific form like AR(1), that is $\Gamma(\alpha)$    

Loglikelihood： $\ell(\boldsymbol{\theta} ; Y, X)=\sum_{i=1}^{n} \ell_{i}\left(\boldsymbol{\theta} ; \mathbf{y}_{i}, X_{i}\right)$，then MLE $\hat{\boldsymbol{\theta}}=\underset{\boldsymbol{\theta}}{\operatorname{argmax}} \ell(\boldsymbol{\theta} ; Y, X)$ .

Search for result we use Gauss-Newton type algorithm.

The observed fisher Information using the sandwich form: $\hat{\mathcal{I}}=\mathbf{A}_{n}^{-1}(\hat{\boldsymbol{\theta}}) \mathbf{B}_{n}(\hat{\boldsymbol{\theta}}) \mathbf{A}_{n}^{-1}(\hat{\boldsymbol{\theta}})$ where $\mathbf{A}_{n}(\theta)$ is the numerical Hessian matrix and $B_n(\theta)=\frac{1}{n} \sum_{i=1}^{n} \dot{\ell}_{i}\left(\boldsymbol{\theta} ; \mathbf{y}_{i}, X_{i}\right) \dot{\ell}_{i}\left(\boldsymbol{\theta} ; \mathbf{y}_{i}, X_{i}\right)^{T}$ . The iteration updates of parameter $\theta$ is by
$$
\theta^{k+1}=\theta^{k}+\epsilon\left\{\mathbf{B}_{n}\left(\theta^{k}\right)\right\}^{-1} \dot{\ell}\left(\theta^{k}\right)
$$
$\epsilon$  is step-halving term. Among Newton-Raphson, downhill simplex, quasi-Newton with numerical derivatives, the Gauss-Newton appears to privde the best trade-off.

4. VGLMs for Trivariate Discrete Data

Moment-based EE method .etc

Trivariate VGLMs

probability mass function:
$$
\begin{aligned} f\left(\mathbf{y}_{i} ; \boldsymbol{\theta}\right) &=P\left(Y_{i 1}=y_{i 1}, Y_{i 2}=y_{i 2}, Y_{i 3}=y_{i 3}\right) \\ &=\sum_{j_{1}=1}^{2} \sum_{j_{2}=1}^{2} \sum_{j_{3}=1}^{2}(-1)^{j_{1}+j_{2}+j_{3}} C\left(u_{i, 1, j_{1}}, u_{i, 2, j_{2}}, u_{i, 3, j_{3}} | \alpha\right) \end{aligned}
$$
where $C\left(u_{i, 1, j_{1}}, u_{i, 2, j_{2}}, u_{i, 3, j_{3}} | \alpha\right)=\Phi_{3}\left\{\Phi^{-1}\left(u_{i, 1, j_{1}}\right), \Phi^{-1}\left(u_{i, 2, j_{2}}\right)\right. ,\Phi^{-1}\left(u_{i, 3, j_{3}}\right) | \alpha \}$with $\alpha$ is exchangeable correlation coefficient $\alpha$ 