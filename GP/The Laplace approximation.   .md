# The Laplace approximation.

For any pdf that is smooth and well peaked around its point of maxima, Laplace proposed to approximate it by a normal pdf. 

The reason is a simple 2nd order Taylor expansion on the log pdf.

Denote $\hat\theta$ as the point of maxima of a pdf $h(\theta)$ , so it is also the maxima of log pdf $q(\theta)=\text{log }  h(\theta)$. Then we have  
$$
\begin{array} { r l } { q ( \theta ) } & { \approx q ( \hat { \theta } ) + ( \theta - \hat { \theta } ) \dot { q } ( \hat { \theta } ) + \frac { 1 } { 2 } ( \theta - \hat { \theta } ) ^ { 2 } \ddot { q } ( \hat { \theta } ) } \\ { } & { = q ( \hat { \theta } ) + 0 + \frac { 1 } { 2 } ( \theta - \hat { \theta } ) ^ { 2 } \ddot { q } ( \hat { \theta } ) \quad \text { [because } \dot { q } ( \hat { \theta } ) = 0 ] } \\ { } & { = \text { const } - \frac { 1 } { 2 } ( \theta - \hat { \theta } ) ^ { 2 } \ddot { q } ( \hat { \theta } ) } \\ { } & { = \text { const } - \frac { ( \theta - \tilde { a } ) ^ { 2 } } { 2 \tilde { b } ^ { 2 } } } \end{array}
$$


The first order derivariate are 0, so only remain the constant term with the second order term.

log pdf is a second order term, then it correspond a Normal distribution, that is, the distribution is approximately $\text { Normal } \left( \tilde { a } , \tilde { b } ^ { 2 } \right)$ with $\tilde { a } = \hat { \theta } \text { and } \tilde { b } ^ { 2 } = \{ - \ddot { q } ( \hat { \theta } ) \} ^ { - 1 }$.

Notes from [lecture notes](http://www2.stat.duke.edu/~st118/sta250/laplace.pdf).

