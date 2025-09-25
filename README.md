# Educational.jl

**Educational.jl** は、数値解析や特殊関数を教育目的で学習・実装するための Julia ライブラリです。  
理論を理解しながら実際のアルゴリズムを試すことを目的としすべてjuliaで書かれており、読みやすくシンプルな実装を目指している。
そのためには速度を犠牲にしテクニカルな分岐は最小限にとどめるようにしている。

## 特徴
以下のような機能を備えている。

### 広義積分
無限区間積分や端点で特異点を含む積分、
1. (-∞ : ∞)の積分
2. [0 : ∞)の積分
3. (-1 : 1)の積分

の三種類があるが区間の引数で自動的に切り替わるようになっている。

### 特殊関数
#### 直行多項式系
ある区間にある重みをかけて直行系を作る多項式である。

これらは誤差を抑えるために漸化式で計算されている。

また、これらは数値だけでなくSymbolicsでも定義されている。

以下のものが実装されている。
- Legendre関数
- Legendre陪関数
- Hermite関数
- Laguerre関数
- Laguerre陪関数
- 第一Chebyshev関数
- 第二Chebyshev関数
- Jacobiの多項式

#### Γ・Β関数

#### ベッセル関数

#### 楕円関数系
- Jacobiの楕円関数
- テータ関数系

## インストール方法
Juliaのインストールは[公式のHP](https://julialang.org/)を参照のこと。その後、ターミナル/コマンドプロプントで

```shell
> git clone https://github.com/T-Yasusi/julia_educational.git
> julia
julia> using Pkg
julia> Pkg.activate(".")
julia> Pkg.instantiate()
```
とすることで必要なパッケージ等がダウンロード・インストールされる。

また、juliaでのコマンド入力は以下のワンライナーでもいい

```shell
> julia -e 'using Pkg; Pkg.activate("."); Pkg.instantiate()'
```

パッケージインストールがうまくいくと
```
> julia --project=. examples/~
```
などで`examples`が走ると成功である。

## ファイル構成など
### ライブラリ本体
`src/Educatinal.jl`に以下のようにモジュールとして定義されており、サブモジュールはファイル名と対応するようにしてある。
```julia:src/Educational.jl
module Educational

include("Educational/DoubleExponentialIntegration.jl")
include("Educational/SpecialFunctions.jl")

using .DoubleExponentialIntegration
using .SpecialFunctions

export DoubleExponentialIntegration, SpecialFunctions

end
```
### テスト
テストは`test/`ディレクトリ以下においてあり、`test/runtests.jl`に纏められている。

### Examples
`examples`にあり、使い方例などがある。

## ライセンス/License
このプロジェクトは MIT License の下で公開されています。詳細は [LICENSE](./LICENSE) ファイルを参照してください。

This project is licensed under the MIT License - see the [LICENSE](./LICENSE) file for details.
