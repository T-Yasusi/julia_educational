### ヤコビの楕円関数
ヤコビの楕円関数は完全楕円積分
```math
K(m) = \int^{\phi}_{0}\frac{1}{\sqrt{1-m \sin^2\theta}} d\theta
```
によって求まる$\phi$を用いて
```math
\mbox{sn}(\phi, m) = \sin\phi \\
\mbox{cn}(\phi, m) = \cos\phi \\
\mbox{dn}(\phi, m) = \sqrt{1-m\sin^2\phi}
```
で定義される。

つまりこれは三角関数を楕円に一般化したものと言える。

内部実装は算術幾何平均(AGM)を使い完全楕円積分を用いて計算しそれをランデン(Landen)変換により$\phi$に変換することで楕円関数を計算する。

算術幾何平均は算術平均を$a_0 = 1$、幾何平均は$b_0 = \sqrt{1-m}$の初期値を使い、
```math
a_{n+1} = \frac{a_n + b_n}{2} \\
b_{n+1} = \sqrt{a_n b_n}
```
とすることで$b_n \leqq \frac{pi}{2}K(m) \leqq a_n$となる性質があり、これを用いて計算する。

この方法任意の$\phi$でも使えるがその際、各ステップごとに$\phi$が変化する。

この変化は積分の変数変換で計算することができ結果だけ示すと以下の式で表される。
```math
\phi_N = 2^N a_N \phi \\
\phi_{n-1} = \frac{1}{2} \left( \phi_n + \arcsin\left( \frac{c_n}{a_n} \sin \phi_n \right) \right)
```
ここで$N$はステップ数であり$c_n = (a_{n-1} - b_{n-1})/2$である。
