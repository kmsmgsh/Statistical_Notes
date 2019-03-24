# Expectation Propagation

Central Important Object: posterior distribution over the latent variables, $p(\mathbf{f}|X,y)$.

> Problem: X, y are both known, why called it latent variables.

suppress the explicit dependence.

Posterior:
$$
p ( \mathbf { f } | X , \mathbf { y } ) = \frac { 1 } { Z } p ( \mathbf { f } | X ) \prod _ { i = 1 } ^ { n } p \left( y _ { i } | f _ { i } \right)
$$
with 
$$
Z = p ( \mathbf { y } | X ) = \int p ( \mathbf { f } | X ) \prod _ { i = 1 } ^ { n } p \left( y _ { i } | f _ { i } \right) d \mathbf { f }
$$
From Bayesian rule
$$
p ( \mathbf { f } | X , \mathbf { y } )=\frac{p(y|\mathbf f,X) p ( \mathbf { f } | X )}{p(y|X)}
$$
In classification, the likelihood $p(y_i|f_i)$ is not Gaussian, this is the key problem here.

Use probibt likelihood for binary classification:
$$
p \left( y _ { i } | f _ { i } \right) = \Phi \left( f _ { i } y _ { i } \right)
$$
This makes the posterior is analytically intracebale. (Key problem!)

To deal with this problem, we approximate the likelihood by a "local likelihood approximation" in the form of an un-normalized Gaussian function in the latnet variable $f_i$.
$$
p \left( y _ { i } | f _ { i } \right) \simeq t _ { i } \left( f _ { i } | \tilde { Z } _ { i } , \tilde { \mu } _ { i } , \tilde { \sigma } _ { i } ^ { 2 } \right) \triangleq \tilde { Z } _ { i } \mathcal { N } \left( f _ { i } | \tilde { \mu } _ { i } , \tilde { \sigma } _ { i } ^ { 2 } \right)
$$
The *site parameter* $\tilde { Z } _ { i } , \tilde { \mu } _ { i } \text { and } \tilde { \sigma } _ { i } ^ { 2 }$ 

Choose parameter for the local approximating distributions $t_i$: Minimize the Kullback-Leibler (KL) divergence between the posterior and its approximation: $\mathrm { KL } ( p ( \mathbf { f } | X , \mathbf { y } ) \| q ( \mathbf { f } | X , \mathbf { y } ) )$ .

Directly minimize is intractable: alternativelly minimize reversed KL divergence $\mathrm { KL } ( q ( \mathbf { f } | X , \mathbf { y } ) \| p ( \mathbf { f } | X , \mathbf { y } ) )$ . That is, using $q(\mathbf f|X,y)$ instead of $p(\mathbf f|X,y)$.

Key idea for EP algorithm: update the individual $t_i$ approximations sequentially.

