# Covariance functions

Covariance function is the crucial ingredient in a Gaussian process predictor.

*Stationary* covariance : a function of $x-x ' $ . It is invariant to translations in the input space.

For example, the squared exponential covariance function: $\operatorname { cov } \left( f \left( \mathbf { x } _ { p } \right) , f \left( \mathbf { x } _ { q } \right) \right) = k \left( \mathbf { x } _ { p } , \mathbf { x } _ { q } \right) = \exp \left( - \frac { 1 } { 2 } \left| \mathbf { x } _ { p } - \mathbf { x } _ { q } \right| ^ { 2 } \right)$  

is stationary. 

The covariance function is a function only of $|x-x'|$ then it is called *isotropic*. (各项同性的): Thus, invariant to all rigid motions.

k is only a function of $r=|x-x'|$ these are also known as radial basis functions (RBFs).

If depends only on $x$ and $x'$ through $x\cdot x'$ we call it a *dot product covariance* function: $k(x,x')=\sigma_0^2+x\cdot x'$ which can be obtained from linear regression by putting $N(0,1)$ priors on the coefficients of $x_d(d=1,...,D)$.

---

*kernel*:  Two arguments mapping a pair of inputs $\mathbf { x } \in \mathcal { X } , \mathbf { x } ^ { \prime } \in \mathcal { X }$ into $\mathbb { R }$.

integral operators: 
$$
\left( T _ { k } f \right) ( \mathbf { x } ) = \int _ { \mathcal { X } } k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) f \left( \mathbf { x } ^ { \prime } \right) d \mu \left( \mathbf { x } ^ { \prime } \right)
$$
$\mu$ denotes a measure.

*symmetric* : $k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) = k \left( \mathbf { x } ^ { \prime } , \mathbf { x } \right)$ : Covariance function must be symmetric kernel.

*Gram matrix*: $K _ { i j } = k \left( \mathbf { x } _ { i } , \mathbf { x } _ { j } \right)$ when given input points $\left\{ \mathbf { x } _ { i } | i = 1 , \dots , n \right\}$ , if k is covariance function then K is covariance matrix.

A *kernel* is said to be positive semidefinite if 
$$
\int k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) f ( \mathbf { x } ) f \left( \mathbf { x } ^ { \prime } \right) d \mu ( \mathbf { x } ) d \mu \left( \mathbf { x } ^ { \prime } \right) \geq 0
$$
A *kernel* is PSD, then the Gram matrices is also PSD.

---

### Mean Square Continuity and Differentiability

Let $x_1,x_2,...$ be a sequence of points and $x_*$ be a fixed point in $\mathbb R^D$ s.t. $\left| \mathbf { x } _ { k } - \mathbf { x } _ { * } \right| \rightarrow 0$ as $k\rightarrow \infty$.

Then a process $f(x)$ is continuous in mean square at $x_*$ if $\mathbb { E } \left[ \left| f \left( \mathbf { x } _ { k } \right) - f \left( \mathbf { x } _ { * } \right) \right| ^ { 2 } \right] \rightarrow 0$ as $k\rightarrow  \infty$.

If this holds for all $x_*\in A$ , $A$  is a subset of $\mathbb {R}^D$  then $f(x)$ is said to be continuous in mean square (MS) over $A$ .

> 感觉很像数列极限推广到函数极限时的定义

A random field is continuous in mean square at $x_*$ iff its covariance function $k(x,x')$ is continuous at the point $x=x'=x_*$ .

For a stationary covariance functions, this reduces to check continuity at $k(0)$.

> Note: Ms continuity does not necessarily imply sample function continuity

Mean square derivative of $f(x)$ in ith direction is defined as
$$
\frac { \partial f ( \mathbf { x } ) } { \partial x _ { i } } =\underset {h\rightarrow \infty} {\mathrm { l.i.m }}\frac { f \left( \mathrm { x } + h \mathbf { e } _ { i } \right) - f ( \mathbf { x } ) } { h }
$$
$\text{l.i.m}$ denotes the limit in mean square and $e_i$ is the unit vector in the ith direction.

Covariance function of $\frac{\partial f(x)}{\partial x_i}$ is given by $\partial ^ { 2 } k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) / \partial x _ { i } \partial x _ { i } ^ { \prime }$ ,  

> 这是在描述Gaussian Process的连续性吗？在Mean Square定义下的连续性和微分？
>
> 而在微分的意义下，函数本身有偏导，偏导下得到的函数也有其协方差函数（所以也是个GP?）

---

## 4.2 Example of Covariance Function

Input domain $\mathcal X$ under $\mathbb R^D$ . 

### 4.2.1 Stationary Covariance Functions 

Kernels: map from $\mathbf { x } \in \mathcal { X } , \mathbf { x } ^ { \prime } \in \mathcal { X }$ into $\mathbb C$ rather than $\mathbb R$ . 0-mean process $f$ is complex, then covariance function is defined as $k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) = \mathbb { E } \left[ f ( \mathbf { x } ) f ^ { * } \left( \mathbf { x } ^ { \prime } \right) \right]$ , $*$ is complex conjugation.

Stationary covariance function : $f(\tau)$ , $\boldsymbol { \tau } = \mathbf { x } - \mathbf { x } ^ { \prime }$ .k as a function of a singpe arguement, i.e. $k(\tau)$.

**Bochner's theorem** : 

A complex-valued function $k$ on $\mathbb R^D$ is the covariance function of a weakly stationary mean square continuous complex-valued random process on $\mathbb {R}^D$ if and only if it can be represented as 
$$
k ( \tau ) = \int _ { \mathbb { R } ^ { D } } e ^ { 2 \pi i s \cdot \tau } d \mu ( \mathbf { s } )
$$
where $\mu$ is a positive finite measure.
$$
k(\tau)=\int _{\mathbb R^D} [\text{cos}(2\pi s\cdot\tau)+ i\text{sin}(2\pi s\cdot\tau)]d\mu(s)
$$

> 总感觉这个形式很强，但是完全没有印象这是啥玩意了。。。某种经典的标准形式

Put non-negative power into each frequency $\mathbb s$; this is analogous to the requirement that the prior covariance matrix $\Sigma_p$ on the weights in be non-negative definite.

if $\mu$ has a density $S(\mathbf s)$ then $S$  is known as the *spectral density* or *power spectrum* corresponding to $k$.

---

.....

Some content about spectrum density and Fourier transform

...

---

The rate of decay of the power spectrum gives important information about the smoothness of the associated stochastic process.

....

> 依旧看不懂中..

...

---

**Squared Exponential Covariance function**
$$
k _ { \mathrm { SE } } ( r ) = \exp \left( - \frac { r ^ { 2 } } { 2 \ell ^ { 2 } } \right)
$$
$\ell$ defining the *characteristic length-scale* . $E[N_{u=0}]=(2\pi\ell)^{-1}$ 

穿过0的次数的期望和length有关系。

The covariance function is infinitely differentiable-> GP with this covariance function has mean sqare derivatives or all orders-> very smooth.

Spectral density of the SE: $S(\mathbf s)=\left( 2 \pi \ell ^ { 2 } \right) ^ { D / 2 } \exp \left( - 2 \pi ^ { 2 } \ell ^ { 2 } s ^ { 2 } \right)$.

Most widely-used kernel within the kernel machines field. (Too strong smoothness like unrealistic in physics modelling).

Scalar inputs with basis functions:
$$
\phi _ { c } ( x ) = \exp \left( - \frac { ( x - c ) ^ { 2 } } { 2 \ell ^ { 2 } } \right)
$$
Gives rise to a GP with covariance function
$$
k \left( x _ { p } , x _ { q } \right) = \sigma _ { p } ^ { 2 } \sum _ { c = 1 } ^ { N } \phi _ { c } \left( x _ { p } \right) \phi _ { c } \left( x _ { q } \right)
$$
Infinite number of basis functions centered everywhere on an interval,
$$
\lim _ { N \rightarrow \infty } \frac { \sigma _ { p } ^ { 2 } } { N } \sum _ { c = 1 } ^ { N } \phi _ { c } \left( x _ { p } \right) \phi _ { c } \left( x _ { q } \right) = \sigma _ { p } ^ { 2 } \int _ { c _ { \min } } ^ { c _ { \max } } \phi _ { c } \left( x _ { p } \right) \phi _ { c } \left( x _ { q } \right) d c
$$

---

**Matern class of Covariance Functions**
$$
k _ { \mathrm { Matern } } ( r ) = \frac { 2 ^ { 1 - \nu } } { \Gamma ( \nu ) } \left( \frac { \sqrt { 2 \nu } r } { \ell } \right) ^ { \nu } K _ { \nu } \left( \frac { \sqrt { 2 \nu } r } { \ell } \right)
$$
with positive parameters $\nu$ and $\ell$, where $K_\nu$ is a modified Bessel function.

This covariance function has a spectral density:

> 难道是一个covariance function对应一个spectral density吗？？？

$$
S ( s ) = \frac { 2 ^ { D } \pi ^ { D / 2 } \Gamma ( \nu + D / 2 ) ( 2 \nu ) ^ { \nu } } { \Gamma ( \nu ) \ell ^ { 2 \nu } } \left( \frac { 2 \nu } { \ell ^ { 2 } } + 4 \pi ^ { 2 } s ^ { 2 } \right) ^ { - ( \nu + D / 2 ) }
$$

---

**The $\gamma$-exponential Covariance Function**
$$
k ( r ) = \exp \left( - ( r / \ell ) ^ { \gamma } \right) \text { for } 0 < \gamma \leq 2
$$
Generalized form of exponential and squared exponential.

---

**Rational Quadratic Covariance Function**
$$
k _ { \mathrm { RQ } } ( r ) = \left( 1 + \frac { r ^ { 2 } } { 2 \alpha \ell ^ { 2 } } \right) ^ { - \alpha }
$$

### 4.2.2 Dot Product Covariance Functions

the kernel $k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) = \sigma _ { 0 } ^ { 2 } + \mathbf { x } \cdot \mathbf { x } ^ { \prime }$ can be obtained from linear regression. If $\sigma^2_0=0$ we call this homogeneous linear kernel, otherwise it is inhomogeneous.

It can be generalized by $k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) =\sigma _ { 0 } ^ { 2 } + \mathbf { x } ^ { \top } \Sigma _ { p } \mathbf { x } ^ { \prime } $ . Similarly, can add power on it for positive integer $p$.

$k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) =\left( \sigma _ { 0 } ^ { 2 } + \mathbf { x } ^ { \top } \Sigma _ { p } \mathbf { x } ^ { \prime } \right) ^ { p }$  by using a general covariance matrix $\Sigma_p$ on the components of $\mathbf x$ .

Explicit feature space construction for the polynomial covariance function.
$$
\begin{array} { r l } { k \left( \mathbf { x } , \mathbf { x } ^ { \prime } \right) } & { = \left( \mathbf { x } \cdot \mathbf { x } ^ { \prime } \right) ^ { p } = \left( \sum _ { d = 1 } ^ { D } x _ { d } x _ { d } ^ { \prime } \right) ^ { p } = \left( \sum _ { d _ { 1 } = 1 } ^ { D } x _ { d _ { 1 } } x _ { d _ { 1 } } ^ { \prime } \right) \cdots \left( \sum _ { d _ { p } = 1 } ^ { D } x _ { d _ { p } } x _ { d _ { p } } ^ { \prime } \right) } \\ { } & { = \sum _ { d _ { 1 } = 1 } ^ { D } \cdots \sum _ { d _ { p } = 1 } ^ { D } \left( x _ { d _ { 1 } } \cdots x _ { d _ { p } } \right) \left( x _ { d _ { 1 } } ^ { \prime } \cdots x _ { d _ { p } } ^ { \prime } \right) \triangleq \phi ( \mathbf { x } ) \cdot \phi \left( \mathbf { x } ^ { \prime } \right) } \end{array}
$$


