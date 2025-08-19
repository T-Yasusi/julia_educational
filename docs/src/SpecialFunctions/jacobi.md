### ヤコビ(Jacobi)関数
1. 微分方程式
```math
(1-x^2)\frac{d^2 P^{(\alpha, \beta)}_n(x)}{dx^2}
+ [\beta - \alpha + (\alpha +\beta + 2)x] \frac{d P^{(\alpha, \beta)}_n(x)}{dx}
+ n (n+\alpha+\beta+1)  P^{(\alpha, \beta)}_n(x) =0
```
2. 直行関係
```math
\int^{1}_{-1} (1-x)^\alpha (1+x)^\beta  P^{(\alpha, \beta)}_n(x)  P^{(\alpha, \beta)}_m(x) dx
= \delta_{n, m} \frac{2^{\alpha+\beta+1}}{2n+\alpha+\beta+1}
\frac{\Gamma(n+\alpha+1)\Gamma(n+\beta+1)}{n!\Gamma(n+\alpha+\beta+1)}
```
3. 漸化式
```math
\begin{aligned}
& P^{(\alpha, \beta)}_n(x) = \frac{(B+Cx) P^{(\alpha, \beta)}_{n-1}(x) - D P^{(\alpha, \beta)}_{n-2}(x) }{A} \\
& \text{ここで、}
\left\{
\begin{array}{l}
A = 2n (n + \alpha + \beta) (2n + \alpha + \beta -2)\\
B = (2n + \alpha + \beta -1) (\alpha^2 - \beta^2) \\
C = (2n + \alpha + \beta -1) (2n + \alpha + \beta) (2n + \alpha + \beta -2) \\
D = 2 (n + \alpha -1) (n + \beta -1) (2n +\alpha + \beta)
\end{array}
\right.
& P^{(\alpha, \beta)}_0(x) = 1
& P^{(\alpha, \beta)}_1(x) = \frac{1}{2}((2+\alpha+\beta)x+(\alpha-\beta))
\end{aligned}
```