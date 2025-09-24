### テータ関数を用いたヤコビの楕円関数
ヤコビの楕円関数は先のテータ関数を用いて表すことが出来る。

その際、テータ関数に渡す$\tau$は楕円関数のモジュラス$m$とその双対$m'=1-m$の完全楕円積分を用いて
```math
K(m) = \int^{\pi/2}_{0} \frac{1}{\sqrt{1-m \sin^2\theta}} d\theta \\
K(m') = \int^{\pi/2}_{0} \frac{1}{\sqrt{1-m' \sin^2\theta}} d\theta \\
\tau = i \frac{K(m')}{K(m)}
```
で求まる。

また、テータ関数の引数は実周期を完全楕円積分で規格化した以下で与えられる。
```math
z = \frac{u}{2K(m)}
```

この、$u,\tau$を用いて以下のように表せる。
```math
\sn(u, m) = \frac{\vartheta_3(0, \tau) \vartheta_1(z, \tau)}{\vartheta_2(0, \tau) \vartheta_4(z, \tau)} \\
\cn(u, m) = \frac{\vartheta_4(0, \tau) \vartheta_2(z, \tau)}{\vartheta_2(0, \tau) \vartheta_4(z, \tau)} \\
\dn(u, m) = \frac{\vartheta_4(0, \tau) \vartheta_3(z, \tau)}{\vartheta_3(0, \tau) \vartheta_4(z, \tau)} 
```
