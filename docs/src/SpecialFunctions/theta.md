### 楕円テータ関数
二重(準)周期性を持つ関数たちで本ライブラリでは以下の定義を用いる。
```math
\vartheta_1(z, \tau) = 2 \sum_{n=0}^{\infty} (-1)^n q^{\left( n+\frac{1}{2} \right)^2} \sin((2n+1)\pi z)\\
\vartheta_1(z, \tau) = 2 \sum_{n=0}^{\infty} q^{\left( n+\frac{1}{2} \right)^2} \cos((2n+1)\pi z) \\
\vartheta_3(z, \tau) = 1 + 2 \sum_{n=0}^{\infty} q^{n^2} \cos(2n \pi z) \\
\vartheta_4(z, \tau) = 1 + 2 \sum_{n=0}^{\infty} (-1)^n q^{n^2} \cos(2n \pi z)
```
この定義では周期性は以下のようになる。
```math
\vartheta_1(z+1, \tau) = (-1) \vartheta_1(z, \tau) \\
\vartheta_2(z+1, \tau) = (-1) \vartheta_2(z, \tau) \\
\vartheta_3(z+1, \tau) = \vartheta_3(z, \tau) \\
\vartheta_4(z+1, \tau) = \vartheta_4(z, \tau) \\
\vartheta_1(z+\tau, \tau) = (-1) \exp(-i(\tau \pi + 2\pi z))\vartheta_1(z, \tau) \\
\vartheta_2(z+\tau, \tau) = \exp(-i(\tau \pi + 2\pi z))\vartheta_2(z, \tau) \\
\vartheta_3(z+\tau, \tau) = \exp(-i(\tau \pi + 2\pi z))\vartheta_3(z, \tau) \\
\vartheta_4(z+\tau, \tau) = (-1) \exp(-i(\tau \pi + 2\pi z))\vartheta_4(z, \tau) 
```
また、積表示では
```math
\vartheta_1(z, \tau) = 2e^{i\pi\tau/4} \sin\pi z \prod_{n=1}^{\infty}(1-e^{2n\pi\tau i})(1 - 2 e^{2n\pi\tau i} \cos 2\pi z +e^{4n\pi\tau i}) \\
\vartheta_2(z, \tau) = 2e^{i\pi\tau/4} \cos\pi z \prod_{n=1}^{\infty}(1-e^{2n\pi\tau i})(1 + 2 e^{2n\pi\tau i} \cos 2\pi z +e^{4n\pi\tau i}) \\
\vartheta_3(z, \tau) = \prod_{n=1}^{\infty}(1-e^{2n\pi\tau i})(1 + 2 e^{(2n+1)\pi\tau i} \cos 2\pi z +e^{4n\pi\tau i}) \\
\vartheta_4(z, \tau) = \prod_{n=1}^{\infty}(1-e^{2n\pi\tau i})(1 - 2 e^{(2n+1)\pi\tau i} \cos 2\pi z +e^{4n\pi\tau i}) \\
```