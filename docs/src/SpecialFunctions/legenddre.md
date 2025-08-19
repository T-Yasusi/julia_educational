### ルジャンドル(Legendre)関数
1. 微分方程式
```math
(1-x^2)\frac{d^2P_n(x)}{dx^2} - 2 x \frac{dP_n(x)}{dx} + n(n+1) y =0
```
2. 直行関係
```math
\int^{1}_{-1} P_n(x) P_m(x) dm = \frac{2}{2n+1} \delta_{n, m}
```
3. 漸化式
```math
\begin{aligned}
& P_n(x) = \frac{(2n-1)xP_{n-1}(x) - (n-1)P_{n-2}(x)}{n} \\
& P_0(x) = 1 \\
& P_1(x) = x
\end{aligned}
```