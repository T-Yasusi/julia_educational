### ヤコビの楕円関数
ヤコビの楕円関数は楕円積分
```math
u = \int^{\phi}_{0}\frac{1}{\sqrt{1-m \sin^2\theta} d\theta
```
によって求まる$\phi$を用いて
```math
\mbox{sn}(u) = \sin\phi \\
\mbox{cn}(u) = \cos\phi \\
\mbox{dn}(u) = \sqrt{1-m\sin^2\phi}
```
で定義される。

つまりこれは三角関数を楕円に一般化したものと言える。

内部実装は算術幾何平均(AGM)を使い以下の完全楕円積分を用いて計算し
```math
K(k)=\int^{\pi/2}_{0}\frac{1}{1-m \sin^2\theta} d\theta
```
それをランデン(Landen)変換により$\phi$に変換することで楕円関数を計算する。