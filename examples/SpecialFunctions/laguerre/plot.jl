using Plots
using Symbolics

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x # Symbolic 変数
max_n = 5    # 最大次数
xs = range(0, 50; length=400) # 描画区間

colors = palette(:tab10) # 色や凡例用
p = plot(title="Laguerre Polynomials \$ L_0 \\sim L_$max_n \$", legend=:topright)

for n in 0:max_n
    Ln_sym = laguerre(n, x) # 多項式を取得（symbolic expression）

    # 数値関数に変換（Symbolic → 実行可能な関数）
    fn_expr = Symbolics.build_function(Ln_sym*exp(-x/2), x)  # 返り値は `Expr`
    Ln_func = eval(fn_expr)  # 実行可能な関数に変換

    ys = [Ln_func(xi) for xi in xs]

    plot!(xs, ys, label="\$ L_$n(x) \$", color=colors[mod1(n+1, length(colors))]) # プロットに追加
end

display(p)
