using Plots
using Symbolics

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x # Symbolic 変数
L = 5    # 最大次数
xs = range(-1, 1; length=400) # 描画区間

colors = palette(:tab10) # 色や凡例用
p = plot(title="Asociated Legendre Polynomials \$ \\hat{P}^{-$L}_$L \\sim \\hat{P}^{$L}_$L \$", legend=:topright)

for m in -L:L
    Pn_sym = normalized_associated_legendre(m, L, x)
    fn_expr = Symbolics.build_function(Pn_sym, x)
    Pn_func = eval(fn_expr)

    ys = [ Pn_func(xi) for xi in xs ]

    plot!(xs, ys, label="\$ \\hat{P}^{$m}_$L(x) \$", color=colors[mod1(m+L+1, length(colors))])
end

display(p)
