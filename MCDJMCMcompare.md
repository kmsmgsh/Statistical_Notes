MCD
$$
\Sigma_{i}^{-1}=T_{i}^{\mathrm{T}} D_{i}^{-1} T_{i}
$$

$$
y_{i j}-\mu_{i j}=\sum_{k=1}^{j-1} \phi_{i j k}\left(y_{i k}-\mu_{i k}\right)+e_{i j}
$$

​	model:
$$
\mu_{ij}=X_{ij}^{T} \beta, \quad \log \sigma_{ij}^{2}=Z_{ij}^{T} \lambda, \quad \phi_{ijk}=z_{ijk}^{T} \gamma
$$
​	$\frac{\partial X^T_{ij}\beta}{\partial \beta}=X_{ij}$ so $\frac{\partial \mu_i^T}{\partial \beta} =\frac{\partial (X_{i}^T\beta)}{\beta}$

​	MLE:
$$
\begin{aligned} U_{1}(\beta) &=\sum_{i=1}^{n} X_{i}^{\top} \Sigma_{i}^{-1}\left(y_{i}-X_{i} \beta\right) \\ U_{2}(\lambda) &=\frac{1}{2} \sum_{i=1}^{n} Z_{i}^{\top}\left(D_{i}^{-2} e_{i}-1_{m_{i}}\right) \\ U_{3}(\gamma) &=\sum_{i=1}^{n} G_{i}^{\top} D_{i}^{-2}\left(r_{i}-G_{i} \gamma\right) \end{aligned}.
$$
GEE:
$$
\begin{array}{c}{S_{1}(\beta)=\sum_{i=1}^{n}\left(\frac{\partial \mu_{i}^{T}}{\partial \beta}\right) \Sigma_{i}^{-1}\left(y_{i}-\mu_{i}\right), \\ S_{2}(\gamma)=\sum_{i=1}^{n}\left(\frac{\partial \hat{r}_{i}^{T}}{\partial \gamma}\right) D_{i}^{-1}\left(r_{i}-\hat{r}_{i}\right)} \\ {S_{3}(\lambda)=\sum_{i=1}^{n}\left(\frac{\partial \sigma_{i}^{2}}{\partial \lambda}\right) W_{i}^{-1}\left(\varepsilon_{i}^{2}-\sigma_{i}^{2}\right)}\end{array}
$$






MCD for Covariance, with $L_i=T_i^{-1}$
$$
\Sigma_{i}=L_{i} D_{i} L_{i}^{\mathrm{T}}
$$

$$
y_{i j}-\mu_{i j}=\sum_{k=1}^{j-1} l_{i j k} \varepsilon_{i k}+\varepsilon_{i j}
$$

MLE:
$$
\begin{aligned} U_{1}(\beta ; \gamma, \lambda) &=\sum_{i=1}^{n} X_{i}^{\mathrm{T}} \Delta_{i} \Sigma_{i}^{-1}\left(y_{i}-\mu\left(X_{i} \beta\right)\right)=0 \\ U_{2}(\gamma ; \beta, \lambda) &=\sum_{i=1}^{n}\left(\frac{\partial \varepsilon_{i}^{\mathrm{T}}}{\partial \gamma}\right) D_{i}^{-1} \varepsilon_{i}=0 \\ U_{3}(\lambda ; \beta, \gamma) &=\sum_{i=1}^{n} H_{i}^{\mathrm{T}}\left(D_{i}^{-1} f_{i}-1_{m_{i}}\right)=0 \end{aligned}
$$
GEE:
$$
\begin{aligned} S_{1}(\beta) &=\sum_{i=1}^{m} X_{i}^{T} \Delta_{i} \Sigma_{i}^{-1}\left(y_{i}-\mu_{i}\left(X_{i} \beta\right)\right)=0 \\ S_{2}(\gamma) &=\sum_{i=1}^{m}\left(\frac{\partial \varepsilon_{i}^{T}}{\partial \gamma}\right) D_{i}^{-1} \varepsilon_{i}=0 \\ S_{3}(\lambda) &=\sum_{i=1}^{m} Z_{i}^{T} D_{i} W_{i}^{-1}\left(\varepsilon_{i}^{2}-\sigma_{i}^{2}\left(Z_{i} \lambda\right)\right)=0 \end{aligned}
$$






ACD, $L_i$ is exactly the $L_i$ in MCD for Covariance
$$
\Sigma_i=D_iL_iL_i^TD_I
$$

$$
y_{ij} / \sigma_{ij}=\sum_{k=1}^{j-1} l_{ijk} \varepsilon_{k}+\varepsilon_{ij}
$$

> where the $\mu_{ij}$ here

$y_i= (y_{i1},...,y_{ip})^T\sim N(0,\Sigma)​$    
$$
\begin{aligned} U_{1}(\beta) &=\sum_{i=1}^{n} X_{i}^{\top} \Sigma_{i}^{-1}\left(y_{i}-X_{i} \beta\right) \\ U_{2}(\lambda) &=\frac{1}{2} \sum_{i=1}^{n} Z_{i}^{\top}\left(h_{i}-1_{m_{i}}\right) \\ U_{3}(\gamma) &=\sum_{i=1}^{n}\left(\epsilon_{i}^{\top} \otimes I_{m_{i}}\right) \frac{\partial \tilde{L}_{i}^{\top}}{\partial \gamma} \tilde{L}_{i}^{-\top} \epsilon_{i} \end{aligned}
$$
Similarly, we might have
$$
\begin{aligned}
S_1(\beta)&=\sum_{i=1}^n (\frac{\partial \mu_i}{\beta})\Sigma_i^{-1}(y_i-\mu_i) \\
S_2(\lambda)&=\\
S_3(\gamma)&=
\end{aligned}
$$
