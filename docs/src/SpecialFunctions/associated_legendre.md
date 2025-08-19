### ルジャンドル(Associated Legendre)陪関数
1. 微分方程式
```math
(1-x^2)\frac{d^2P^m_l(x)}{dx^2} - 2 x \frac{dP^m_l(x)}{dx} + \left( l(l+1) - \frac{m^2}{1-x^2} \right) y =0
```
2. 直行関係
```math
\int^{1}_{-1} P^m_l(x) P^{m}_{l'}(x) dm = \frac{2}{2l+1}\frac{(l+m)!}{(l-m)!} \delta_{l,l'}
```
3. 漸化式
```math
\begin{aligned}
& P^m_{l+1}(x) = \frac{(2l+1)xP^m_n(x) - (l+m)P_{l-1}(x)}{l-m+1} \\
& P^m_{m-1}(x) = 0 \\
& P^m_m(x) = (-1)^m (2m-1)!! (1-x^2)^{\frac{m}{2}} 
\end{aligned}
```