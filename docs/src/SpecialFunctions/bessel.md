### ベッセル関数
ベッセルの以下の常微分方程式の特殊解である。
```math
x^2 \frac{d^2y}{dx^2} + x \frac{dy}{dx} + (x^2-\alpha^2) y =0
```

本ライブラリでは第一種ベッセル関数は以下の積分表示で実装されている。
```math
J(\nu, x) = \frac{1}{\pi} \left( \int^{\pi}_{0} \cos(\nu t - x \sin(t)) dt - \sin(\nu \pi)\int^{\infty}_{0} \exp(-x \sinh(t) - \nu t )dt \right) \\
J(\nu, z) = \frac{1}{2\pi} \int^{\pi}_{-\pi} \exp(i(\nu t - z \sin(t) )) dt
```
上が実数用で下が複素数用であり、実数用は実数を返す。

第二種のベッセル関数、つまりノイマン関数は以下であるが$\mu$が整数の場合は不定形のためロピタルの定理により微分で実装されている。
```math
Y(\nu, z) = \frac{J(\nu, z) \cos(\nu \pi) - J(-\nu, z)}{sin(\nu \pi)} \\
Y(n , z) = \lim_{\nu \rightarrow n} \frac{J(\nu, z) \cos(\nu \pi) - J(-\nu, z)}{\sin(\nu \pi)} \\
         = \frac{1}{\pi} \left( \frac{\partial J(n, z)}{\partial \nu} - (-1)^n \frac{\partial J(-n, z)}{\partial \nu} \right)
```