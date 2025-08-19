### 第二種シェビチェフ(Chebyshev)関数
1. 微分方程式
```math
(1-x^2)\frac{d^2 U_n(x)}{dx^2} - 3x\frac{dU_n(x)}{dx} + n(n+2) U_n(x) = 0
```
2. 直行関係
```math
\int^{1}_{-1} U_n(x) U_m(x) \sqrt{1-x^2} dx = \frac{2}{\pi} \delta_{n, m}
```
3. 漸化式
```math
\begin{aligned}
& U_n(x) = 2x U_{n-1}(x) - U_{n-2}(x) \\
& U_0(x) = 1 \\
& U_1(x) = 2x
\end{aligned}
```