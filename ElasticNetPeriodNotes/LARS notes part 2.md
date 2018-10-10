# LARS notes part 2

#### Modified versions of Least Angle Regression

The result of LARS is similar to stagewise lasso estimates for the diabetes data.

Simple modifications of the LARS algorithm can produce Lasso or Stagewise estimates, also another modification can produce the elastic net estimates.

> *All three (maybe four) algorithms can be viewed as moderately greedy forward stepwise procedures whose forward progress is determined by compromise among the currently most correlated covariates.* 

 

LARS moves along the most obvious compromise direction (That's why the LARS-EN modified the matrix G, to slightly change the direction of moving) , the equiangular vector, while Lasso and Stagewise put some restrictions on the equiangular strategy (The same as elastic net).



#### 3.1 The LARS/Lasso relationship

Lasso solutions can be generated by a minor modification of LARS algorithm. 与homotopy method(同伦方法？？？)有关，though the LARS approach is somewhat more direct.

$\hat\beta$ be a Lasso solution with $\widehat { \boldsymbol { \mu } } = X \widehat { \boldsymbol { \beta } }$ . The sign of any non-zero coordinate $\hat\beta_j$ must agree with the sign $s_j$ of the current correlation $\widehat { c } _ { j } = \mathbf { x } _ { j } ^ { \prime } ( \mathbf { y } - \widehat { \boldsymbol { \mu } } )$  ,
$$
\operatorname { sign } \left( \widehat { \beta } _ { j } \right) = \operatorname { sign } \left( \widehat { c } _ { j } \right) = s _ { j }
$$
所以说，$\hat\beta_j$的符号，必须和当前与residual的相关性的符号一致。怎么解释呢，也就是说，$\hat\beta_j$ 的符号，必须与residual和$X_j$ 的相关系数的符号一致。这是啥意思呢。就是说direction必须和correlation的方向一致，不能往返方向跑？？？？

LARS does not enforce restriction of this, but it can easily be modified to do so.

Current position: Just completed a LARS step,

In this case, we have a new active set $\mathcal{A}$ and correspond LARS estimate $\hat\mu $ corresponds to a Lasso solution $\hat\mu=X\hat\beta$ . 

Let 
$$
w_{\mathcal{A}} = A_{\mathcal{A}}\mathcal{G}_{\mathcal{A}} ^{-1} 1_{\mathcal A}
$$




（这个定义和LARS original一致）

Define $\hat d$ to be the m-vector equaling $s _ { j } w _ { \mathcal { A } j }$ for $j\in \mathcal{A}$ and zero elsewhere. 

Remeber that $w_{\mathcal{A}}$ is the vector that projection $x_j$ (or the coefficient of the linear combination ) to the bisector direction . $u _ { A } = X _ { \mathcal { A } } w _ { \mathcal { A } }$. A vector of length the size of $\mathcal{A}$  .

 Moving in the positive $\gamma$ direction along the LARS line , we see that 
$$
\boldsymbol { \mu } ( \gamma ) = X \boldsymbol { \beta } ( \gamma ) \text { where } \quad \beta _ { j } ( \gamma ) = \widehat { \beta } _ { j } + \gamma \widehat { d } _ { j }
$$
for $j\in \mathcal{A}$ . Therefore $\beta_j(\gamma)$ will change sign at 
$$
\gamma _ { j } = - \widehat { \beta } _ { j } / \widehat { d } _ { j }
$$
The first such change occurring at 
$$
\widetilde { \gamma } = \min _ { \gamma _ { j } > 0 } \left\{ \gamma _ { j } \right\}
$$
Say for covariate $x_{\tilde j}$ ; $\tilde \gamma$ equals infinity by definition if there is no $\gamma_j>0$ .

If $\tilde \gamma$ is less than $\hat\gamma$ ,也就是说，走到一半走变号了

then $\beta_j(\gamma)$ cannot be a Lasso solution for $\gamma>\tilde \gamma$ since the sign restriction must be violated: In this time, sign of $\beta_{\tilde j}(\gamma) $ has changed while $c_{\tilde j} (\gamma)$ cannot change sign within a single LARS step since $|c_{\tilde j}(\gamma)|=\hat C-\gamma A_{\mathcal{A}}>0$ .

##### *Lasso modification*

If $\tilde \gamma<\hat \gamma$, stop the ongoing LARS step at $\gamma=\tilde \gamma$ and remove $\tilde j$  from the calculation of the next equiangular direction. That is
$$
\widehat { \boldsymbol { \mu } } _ { \mathcal { A } _ { + } } = \widehat { \boldsymbol { \mu } } _ { \mathcal { A } } + \widetilde { \gamma } \mathbf { u } _ { \mathcal { A } } \quad \text { and } \quad \mathcal { A } _ { + } = \mathcal { A } - \{ \widetilde { j } \}
$$
Rather than (2.12) $\widehat { \mu } _ { A _ { + } } = \widehat { \mu } _ { A } + \widehat { \gamma } \mathbf { u } _ { A }$ , update the whole solution path.

#### Theorem 1. Under the Lasso modification and assuming the "one at a time" condition discussed below, the LARS algorithm yields all Lasso solutions.



The active set $\mathcal A$ grow monotonically larger as the original LARS algorithm progresses, but the Lasso modification allows $\mathcal A$ to decrease.  "One at a time" means that the increases and decreases never involve more than a single index j. This is the usual case for quantitative data, and can always be realized by adding a little jitter to the $y$ values. Section 5 discusses tied situations.

---

 slides 更新到这里。

---

 



 






