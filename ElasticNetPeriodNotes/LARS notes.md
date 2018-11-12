# LARS notes

Abstract: 

Useful and less greedy version of traditional forward selection methods.

Main property: 

- Implement the Lasso, lasso Modification: Calculates all possible Lasso estimates for a given problem.

- Different version: Another modification efficiently implements forward stagewise linear regression.

- A simple approximation for the degree of freedom of a LARS estimate is available, from which we derive a $C_p$ estimate of prediction error. thisi allws a principled choice among the range of possible LARS estimates.

  (Not quite understand the final part of the LARS goals.) 

---

LARS relates: classic model-selection method known as "forward selection" or "forward stepwise regression."

- Forward Selection

  - Given a collection of possible predictors, select the one largest absolute correlation with the response $y$, say $x_{j_1}$, and perform simple linear regression of $y$ on $x_{j_1}$ , than leaves a residual vector which is orthogonal to $x_{j_1}$. Project the other predictors orthogonally to $x_{j_1}$ nd repeat the selection process.  After k steps this results in a set of predictors $x_{j_1},...,x_{j_k}$ that are then used in the usual way to construct a k-parameter linear model.  

-  Forward stagewise

  - More cautious version of forwad selection-> take thousands tiny steps as it moves toward a final model.

  - Original motivation for the LARS algorithm.

  - LARS-Lasso-Stagewise connection is comceptually as well as computationally useful.

---

Model construction:

Predict response $y$ from covariates $x_1,\cdots,x_n$ .

By location and scale transformations we always assume that the covariates have been standardized to have mean 0 and unit length, and that the response has mean 0.
$$
\sum_{i=1}^n y_i=0\ \ \ \sum_{i=1}^n x_{ij}=0\ \ \ \sum_{i=1}^n x_{ij}^2=1\ \ \ \ \textit{for} \ \ j=1,2,...,m
$$
Regression coefficients : $\widehat { \boldsymbol { \beta } } = \left( \widehat { \beta } _ { 1 } , \widehat { \beta } _ { 2 } , \ldots , \widehat { \beta } _ { m } \right) ^ { \prime }$gives prediction vector $\hat\mu$
$$
\hat { \boldsymbol { \mu } } = \sum _ { j = 1 } ^ { m } \mathbf { x } _ { j } \hat { \beta } _ { j } = X \hat { \boldsymbol { \beta } } \quad \left[ X _ { n \times m } = \left( \mathbf { x } _ { 1 } , \mathbf { x } _ { 2 } , \ldots , \mathbf { x } _ { m } \right) \right]
$$
Total squared error
$$
S ( \widehat { \boldsymbol { \beta } } ) = \| \mathbf { y } - \widehat { \boldsymbol { \mu } } \| ^ { 2 } = \sum _ { i = 1 } ^ { n } \left( y _ { i } - \widehat { \mu } _ { i } \right) ^ { 2 }
$$
$L_1$ norm for lasso 

$$
T ( \widehat { \boldsymbol { \beta } } ) = \sum _ { j = 1 } ^ { m } \left| \widehat { \beta } _ { j } \right|
$$

$$
\textit{Lasso: minimize     }\ \ \ S(\hat\beta) \textit{subject  to }\ \ \ \ T ( \widehat { \beta } ) \leq t
$$



```Quadratic programming techniques can be used to solve (5).though we will present an easier method here, closely related to the “homotopy method” of Osborne, Presnell and Turlach (2000a)."```

---





The main point: 

LARS is a stylized version of the stagewise procedure that uses a simple mathematical formula to accelerate the computations.







