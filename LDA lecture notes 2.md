# Longitudinal Data Analysis

## lecture 2

Talk about the statistical model:

Start from the linear regression model

student performance for examintion
$$
y_i=\beta_0+\beta_1x_{i1}+...+\beta_{p-1}x_{i(p-1)}+\epsilon_i
$$
Where $i=1,...,n$
$$
\left[ \begin{array} { c } { y _ { 1 } } \\ { y _ { 2 } } \\ { \vdots } \\ { y _ { i } } \\ { \vdots } \\ { y _ { n } } \end{array} \right] = \left[ \begin{array} { c c c c } { 1 } & { x _ { 11 } } & { \dots } & { x _ { 1 ( p - 1 ) } } \\ { 1 } & { x _ { 21 } } & { \dots } & { x _ { 2 ( p - 1 ) } } \\ { \vdots } & { \vdots } & { \ldots } & { \vdots } \\ { 1 } & { x _ { i 1 } } & { \cdots } & { x _ { i ( p - 1 ) } } \\ { \vdots } & { \vdots } & { \ldots } & { \vdots } \\ { 1 } & { x _ { n 1 } } & { \dots } & { x _ { n ( p - 1 ) } } \end{array} \right] \left[ \begin{array} { c } { \beta _ { 0 } } \\ { \beta _ { 1 } } \\ { \vdots } \\ { \beta _ { p - 1 } } \end{array} \right] + \left[ \begin{array} { c } { \epsilon _ { 1 } } \\ { \epsilon _ { 2 } } \\ { \vdots } \\ { \epsilon _ { i } } \\ { \vdots } \\ { \epsilon _ { n } } \end{array} \right]
$$
$Var(\epsilon_i)=\sigma^2>0$

For each $y_i$ , we have density function, then we can estimate by MLE.

