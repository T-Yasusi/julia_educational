using Plots
using Symbolics

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.DoubleExponentialIntegration

@variables x # Symbolic 変数
L = 5    # 最大次数
xs = range(0, 50; length=400) # 描画区間

colors = palette(:tab10) # 色や凡例用
p = plot(title="Asociated Laguerre Polynomials \$ L^{0}_$L \\sim L^{$L}_$L \$", legend=:topright)

for m in 0:L
    Ln_sym = associated_laguerre(m, L, x)
    fn_expr = Symbolics.build_function(exp(-x/2) * x^(m/2) * Ln_sym * factorial(m)/factorial(m+L), x)
    Ln_func = eval(fn_expr)
    
    ys = [ Ln_func(xi) for xi in xs ]

    plot!(xs, ys, label="\$ L^{$m}_$L(x) \$", color=colors[mod1(m+L+1, length(colors))])
end

display(p)
