---
layout: post
mathjax: true
comments: true
title: "Elastic Net notes Part start 3.4"
---
# Elastic-net Notes from part 3.4 Computation: the Algorithm LARS-EN



As we assumed before, LARS is a efficient method to solve Lasso-type 

By lemma 1, for each fixed $\lambda_2$ the elastic net problem is equivalent to a lasso problem on the augmented data set. So the entire elastic net solution path can be efficiently computed by LARS. The only problem that should be cared is p >> n case may slow down the computation significantly.



---



A key differentce between LARS and LARS-EN is the The matrix using to calculate the angle-bisector is 

$G=X^TX$ , but for elastic net, the augumented data set, $G^*$ comes to $G_{A_k}^* =X^{*T}_{A_{k}} X^*_{A_k}  $ $\mathbf { G }^* _ { A } = \frac { 1 } { 1 + \lambda _ { 2 } } \left( \mathbf { X } _ { A } ^ { \mathrm { T } } \mathbf { X } _ { A } + \lambda _ { 2 } \mathbf { I } \right)$  . That is the form of LARS-EN. We need calculate the inverse of this new matrix.   

As the LARS-Lasso with condition "one at a time", the updating or downdating of case one involve one covariates in each step.   

A simple formula to update the Cholesky factorization of $\mathbf { X } _ { A _ { k - 1 } } ^ { \mathrm { T } } \mathbf { X } _ { A _ { k - 1 } } + \lambda _ { 2 } \mathbf { I }$ which is very similar to updating the Cholesky factorization for $\mathbf { X } _ { A _ { k - 1 } } ^ { \mathrm { T } } \mathbf { X } _ { A _ { k - 1 } }$ (Golub and Van Loan, 1983) .  

---



In addition, when calculating the equiangular vector and the inner products of the nonactive predictors with the current residuals, we can save computations by using the simple fact that $X^*_j$ has $p-1$ zero elements. That is, do not explicitly use $X^*$ to ccompute all the quantities in algorithm LARS. It is also economical to record only the non-zero coefficients and the active variables set at each LARS-EN step.

LARS-EN also do not need run to end. Especially for p>>n casae. Experiments show that the optimal results are achieved at an early stage.

---

#### Choice of tuning parameters.

3.5.1 Lasso conventional tuning parameter：

There are several ways to model the elastic net.

- Use $\lambda_1,\lambda_2$  Parameter the elastic net, but this is not the only way.

- Remember that $\hat \beta ^*$ and  $\hat\beta$ have the proportional relationship. We can model it with $(\lambda,s)$ or $(\lambda,t)$ , which $t$  is the $L_1$ - norm of the coefficient, s is the fraction of the $L_1$-Norm.

  The benefits of using $s$ is that $s$ is always valued within $[0,1]$ .

- > In algorithm LARS the lasso is described as a forward stagewise additive fitting procedure and shown to be (almost) identical to $\epsilon-L_2$ boosting. 

  In the view pointed out upon, the number of steps k of algorith LARS also is tuning parameter for the lasso. That is, for fixed $\lambda_2$ , the elastic net is solved by LARS-EN; hence similarly, we can use the number of the LARS-EN steps (k) as the second tuning parameter besides $\lambda_2$. 

---

3.5.2 Chose tuning parameter.

Only training data are available: tenfold cross-validation.

Because there are two-tuning parameters, we need to cross-validate on a two-dimensional surface. Typically we first pick a (relatively small) grid of values for $\lambda_2$ , say $(0,0.01,0.1,1,10,100)$. Then for each $\lambda_2$ , algorithm LARS-EN produces the entire solution path of the elastic net. 

In this way, the other tuning parameter $(\lambda_1,s,\text{or},k)$ is selected by tenfold CV. The chosen $\lambda_2$ is the one giving the smallest CV error.

---



















  





 











