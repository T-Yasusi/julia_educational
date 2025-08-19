### ラゲール(Laguerre)関数
1. 微分方程式
```math
x \frac{d^2L_n(x)}{dx^2} + (1-x) \frac{dL_n(x)}{dx} + n L_n(x)=0
```
2. 直行関係
```math
\int^{\infty}_{0} e^{-x} L_n(x) L_m(x) dx = \delta_{n, m}
```
3. 漸化式
```math
\begin{aligned}
& L_n(x) = \frac{ (2n -x -1)L_{n-1}(x) - (n-1)L_{n-2}(x) }{n} \\
& L_0(x) = 1 \\
& L_1(x) = 1-x
\end{aligned}
```