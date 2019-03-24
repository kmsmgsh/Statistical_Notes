# 3.1 Classification Problems

Joint probability $p(y,x)$. y is the class label.

Joint probability: $ p ( y ) p ( \mathbf { x } | y ) \text { or as } p ( \mathbf { x } ) p ( y | \mathbf { x } )$

This induced two approaches for classification.

- The first one is *generative* approach.:

  Compute the class-conditional distribution for each class 

  also the prior. Then posterior is 
  $$
  p ( y | \mathbf { x } ) = \frac { p ( y ) p ( \mathbf { x } | y ) } { \sum _ { c = 1 } ^ { C } p \left( \mathcal { C } _ { c } \right) p ( \mathbf { x } | \mathcal { C } _ { c } ) }
  $$

- 

Idea: Create *models* for $p ( \mathbf { x } | y ) , \text { or } p ( y | \mathbf { x } )$ respectively.

---

Common choice: Model the class-conditional densities with Gaussians"

$p ( \mathbf { x } | \mathcal { C } _ { c } ) = \mathcal { N } \left( \boldsymbol { \mu } _ { c } , \Sigma _ { c } \right)$ .

Placing appropriate priors on mean and covariance is need in Bayesian treatment.

Problem: Gaussian model is a strong assumption. If the assumption cannot be fulfilled, the model may perform poorly.

---

Binary Discriminative cases:

Turn the output of a regression model into a class probability by link function.

For example:  *linear logistic regression* 
$$
p \left( \mathcal { C } _ { 1 } | \mathbf { x } \right) = \lambda \left( \mathbf { x } ^ { \top } \mathbf { w } \right) , \quad \text { where } \quad \lambda ( z ) = \frac { 1 } { 1 + \exp ( - z ) }
$$
Another common choice of cumulative density function: standard normal dsitribution : *probit regression*
$$
\Phi ( z ) = \int _ { - \infty } ^ { z } \mathcal { N } ( x | 0,1 ) d x
$$

---

Benefits:

Discriminative approach : DIrectly modelling what we want, $p(y|x)$. 

Because Density estimation for the class-conditional distributions is a hard problem especially in high dimension case, the generative approach may need to solve a harder problem then we expect.

However, this is not always true. When dealing with missing input values, outliers and unlabelled data, $p(x) $ would be helpful in this case. These can be obtained from marginalizing out the y from joint as $p ( \mathbf { x } ) = \sum _ { y } p ( y ) p ( \mathbf { x } | y )$ .

This chapter, we mainly consider the GPC developed in discriminative.

---

### 3.1.1 Decision Theory for Classification

Make a model about the probability is useful but this is not what we want eventually. The final thing is about making a decision. Then we need consider decision theory.

$\mathcal { L } \left( c , c ^ { \prime } \right)$ is loss when making decision $c'$ when true class is $\mathcal C_c$ . 

Expected loss, taking decision $c'$ given x : $R _ { \mathcal { L } } \left( c ^ { \prime } | \mathbf { x } \right) = \sum _ { c } \mathcal { L } \left( c , c ^ { \prime } \right) p \left( \mathcal { C } _ { c } | \mathbf { x } \right)$ .

Optimal decision : $c^*$ minimizes $R _ { \mathcal { L } } \left( c ^ { \prime } | \mathbf { x } \right)$ . 

Common choice: 0-1 loss.

Not always appropriate.

Example: Failing to spot a disease when carrying out medical test compared to the cost of a false positive on the test, so that $\mathcal { L } \left( c , c ^ { \prime } \right) \neq \mathcal { L } \left( c ^ { \prime } , c \right)$.

有病被诊断为没病，没病被诊断为有病。这两个loss不一样

---

Optimal classifier: Bayes classifier.

Feature space: divided into decision regions( Located in such regions will be allocated to the same label of class).

Boundaries among the regions: *decision surfaces* or *decision boundaries*.

One thing could happen: $\max _ { j } p \left( \mathcal { C } _ { j } | \mathbf { x } \right)$ is relatively low : strong overlap or lack of samples.

May need add a reject option (threshold) such as $\max _ { j } p \left( \mathcal { C } _ { j } | \mathbf { x } \right) \geq \theta$ . Data point should over the threshold or leaved as "need deeper investigate"

---

classification function: minimize the risk (expected loss), defined as
$$
R _ { \mathcal { L } } ( c ) = \int \mathcal { L } ( y , c ( \mathbf { x } ) ) p ( y , \mathbf { x } ) d y d \mathbf { x }
$$
As $p(y,\mathbf x)$ is unkown, one often then weeks to minimize empirical risk $\sum _ { i = 1 } ^ { n } \mathcal { L } \left( y _ { i } , c \left( \mathbf { x } _ { i } \right) \right)$ .

---

## Linear Models for Classification

SVM literature use the labels $y=+1$ and $y=-1$ to distinguish the two classes.

Likelihood:
$$
p ( y = + 1 | \mathbf { x } , \mathbf { w } ) = \sigma \left( \mathbf { x } ^ { \top } \mathbf { w } \right)
$$
weight vector $\mathbf w$ and $\sigma(z)$ can be any sigmoid function.

$\sigma(z)=\lambda(z)$ : logistic regression

$\sigma(z)=\Phi(z)$ : linear probit regression, using the cumulative Gaussian.
$$
\text{logit}(x)=log((p_1|x)/(p_0|x))=x^t\mathbf w
$$
also called *log odds ratio.*

---

Given dataset $\mathcal { D } = \left\{ \left( \mathbf { x } _ { i } , y _ { i } \right) | i = 1 , \ldots , n \right\}$ , labels each are independently, conditional on $f(x)$. Gaussian prior: $\mathbf w\sim\mathcal N(0,\Sigma_p)$ as for regression in eq.(2.4), un-normalized log posterior
$$
\log p ( \mathbf { w } | X , \mathbf { y } ) \stackrel { c } { = } - \frac { 1 } { 2 } \mathbf { w } ^ { \top } \Sigma _ { p } ^ { - 1 } \mathbf { w } + \sum _ { i = 1 } ^ { n } \log \sigma \left( y _ { i } f _ { i } \right)
$$
Prediction:
$$
p \left( y _ { * } = + 1 | \mathbf { x } _ { * } , \mathcal { D } \right) = \int p \left( y _ { * } = + 1 | \mathbf { w } , \mathbf { x } _ { * } \right) p ( \mathbf { w } | \mathcal { D } ) d \mathbf { w }
$$

---

## 3.3 Gaussian process Classification

Idea: Place a GP prior over the latent function $f(x)$ and then "squash" through the logistic function to obtain a prior on $\pi ( \mathbf { x } ) \triangleq p ( y =+ 1 | \mathbf { x } ) = \sigma ( f ( \mathbf { x } ) )$ . 

