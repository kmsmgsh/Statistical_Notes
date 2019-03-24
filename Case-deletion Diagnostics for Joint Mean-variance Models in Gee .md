# Case-deletion Diagnostics for Joint Mean-variance Models in Gee 

## LiNa 

统计诊断

longitudinal的统计诊断

Intro: GEE: distributed independent method (Liang): modelling mean structure

Pan 2006: mean covariance model

Preisser 1996: GEE deletion diagnostics诊断

对joint mean covariance model在GEE框架下的统计诊断问题

标准的LDAnotation

$y_i$,$t_i$,$t_{i1},...,t_{im_i}$

$var(y_i)=\Sigma_i$

具有一致性，不具有有效性？？？

$\mu_i$和$\Sigma_i$ 同时建模

$\Sigma_i$ 建模：mcd

自回归的统计意义

估计方程：

S_1

S_2

S_3

对$\mu _i$,$\sigma$,$\phi$的GEE估计方程

稳健的：独立的或者AR(1)或者cs的结构

不影响$\beta,\gamma,\lambda$的估计

选择$\rho=0$, $R_i(\rho)$ 对诊断的影响。

估计方程的fisher信息阵，是对角阵

主题内容：在这个模型框架下做case-deletion diagnostics

$\theta$全部感兴趣的参数放在一起

$\hat\theta_{[i]}$:第i个个体删除以后，剩下的数据给出的估计

与$\hat\theta$之间的差距很大，那第i个个体影响就很大

算$\hat\theta-\hat\theta_{[i]}$

有三块，beta，gamma，和lambda的差异

第一块是均值，已经被做过了，这个工作是做剩下这两个参数

beta的差有解析表达式

leverage matrix

gamma和lambda的形式很类似

$F_i$:$p\times n_i$ 

$F$ ：竖着排，$n_1\times p$ 累一个$n_i\times p$ ….最后是一个$n\times p$的矩阵

不需要一个一个去提出，直接有公式的解析表达式

leverage是H trace

公式：直接套用preceiser 1996的公式：特别是第二套和第三套？ 主要是第一个，第二个和第三个从GEE方程的角度是一样的

1996年的文章已经做了推导

有了

$\hat\theta-\hat\theta_{[i]}$ 

考虑cook distance

不同的M的选择会有不同的结果：选var或者quasi-fisher information matrix。theta的cook -distance: cook distance for beta, gamma, 和lambda

接下来就是模拟

真实的cook距离：与提取出来的比较

然后是诊断的效果如何

两个模型：正态的数据

