### 第一種シェビチェフ(Chebyshev)関数
1. 微分方程式
```math
(1-x^2)\frac{d^2 T_n(x)}{dx^2} - x\frac{dT_n(x)}{dx} + n^2 T_n(x) = 0
```
2. 直行関係
```math
\int^{1}_{-1} \frac{ T_n(x) T_m(x) }{ \sqrt{1-x^2} } dx
= \begin{cases}
\pi \delta_{n, m} & (n=0) \\
\frac{\pi}{2} \delta_{n, m} & (n>0)
\end{cases}
```

3. 漸化式
```math
\begin{aligned}
& T_n(x) = 2x(n-1)T_{n-1}(x) - T_{n-2}(x) \\
& T_0(x) = 1 \\
& T_1(x) = x
\end{aligned}
```