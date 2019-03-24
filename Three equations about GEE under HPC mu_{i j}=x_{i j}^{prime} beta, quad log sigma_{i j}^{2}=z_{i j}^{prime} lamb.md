- Three equations about GEE under HPC $\mu_{i j}=x_{i j}^{\prime} \beta, \quad \log \sigma_{i j}^{2}=z_{i j}^{\prime} \lambda \quad \phi_{i j k}=\omega_{i j k}^{\prime} \gamma$
- Final thesis Page 75
  - The three GEEs equations:  the $\gamma$ part: for $\phi_{ijk}$ : Why use $\rho_{ijk}$ as the response average number 
  - By the theorem we have, we can use $r_i$ in Ye,2006, the similar form but the relationship between the $\phi$ with $r$ is not linear but a complex link function.--》 seems not work, because the Ye part is Cholesky decomposition for the precision matrix, need modify from acd.
    - The derivatives of second GEE, the $r_i​$ follows $MVN_p(0,\Sigma_i)​$ , why $D_i^{-1}\Sigma_iD_i^{-1}​$ follows a wishart distribution? This should be a constant matrix. Or it should rewritten as $D_i^{-1}r_ir_i'D_i​$ follows wishart distribution, then the variance of its ij-entry is $n(v_{ij}^2+v_{ii}v_{jj})​$ , that is the equation (3.5): $1(\rho^2_{ijk}+\rho_{ijj}\rho_{ikk})=(\rho_{ijk}^2+1)​$ 

- Page 78, the $\phi$ to $\gamma$ need another link function because $\phi$ is constrained in $(0,\pi)$ , the link function is 

   $\phi_{i,j,k}=g(x_{ijk})=\frac{\pi}{2}-\textit{arctan}\ x_{i,j,k}$, with $x_{ijk}=\omega'_{ijk}\gamma$

- The form of the W matrix and M matrix.









自回归系数和time lag的关系，以及time lag下的数据的相关关系。

自回归系数

​	`	