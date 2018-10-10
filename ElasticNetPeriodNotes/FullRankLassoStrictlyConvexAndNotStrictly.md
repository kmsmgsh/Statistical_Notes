Problem: For general problem
$$
\hat { \beta } = \underset { \beta } { \operatorname { argmin } } | y - X \beta | ^ { 2 } + \lambda J ( \beta )=\underset { \beta } { \operatorname { argmin } } L(\beta)
$$
If X is not column-full-rank, then the quadratic form is not strictly convex. 

Proof : The theorem about strictly convex: the first-order deriatives and second order deriatives should strictly great than 0, that is $L'(\beta)>0$ and $L''(\beta)>0$ . (Generally speaking, the deriative and 2nd order deriative(Hessian Matrix) is positive definite or semi-positive definite).

The second deriative of quadratic part of the optimization problem is $X^TX$ , if $X$ is not full-column-rank, then $X^TX$ would be semi-positive definite rather than positive definite. Then this part can only hold the convex rather than strictly convex. 

If the penalty term also cannot hold the strictly convex, than the loss function is convex instead of strictly convex. If the penalty term is srictly convex, than a strictly convex term + convex term is strictly convex term. 