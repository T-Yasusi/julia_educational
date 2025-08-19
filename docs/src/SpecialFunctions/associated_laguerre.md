### ラゲール(Associated Laguerre)陪関数
1. 微分方程式
```math
x\frac{d^2L^k_n(x)}{dx^2}+(k+1-x)\frac{dL^k_n(x)}{dx}+nL^k_n(x)=0
```
2. 直行関係
```math
\int^{\infty}_{0} e^{-x} x^k L^k_n(x) L^k_m(x) dx = \frac{n!}{(n+k)!} \delta_{n, m}
```
3. 漸化式
```math
\begin{aligned}
& L^k_n(x) = \frac{ (2-x+k-1)L^k_{n-1}(x) - (n-1+k)L^k_{n-2}(x) }{n} \\
& L^k_0(x) = 1 \\
& L^k_1(x) = k+1-x
\end{aligned}
```