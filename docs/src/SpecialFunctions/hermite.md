### エルミート(Hermite)関数
1. 微分方程式
```math
\frac{d^2H_n(x)}{dx^2} - 2x \frac{dH_n(x)}{dx} + 2n H_n(x) =0
```
2. 直行関係
```math
\int^{\infty}_{-\infty} e^{-x^2}H_n(x) H_m(x) dx = \pi 2^n n! \delta{n, m}
```
3. 漸化式
```math
\begin{aligned}
& H_n(x) = 2xH_{n-1}(x) - 2(n-1)H_{n-2}(x) \\
& H_0(x) = 1 \\
& H_1(x) = 2x
\end{aligned}
```