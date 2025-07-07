using Symbolics
using QuadGK
using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x
max_n = 5 # 最大次数

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

# 直交性チェック
for m in 0:max_n
    for n in 0:max_n
        Pm_sym = legendre(m, x)
        Pn_sym = legendre(n, x)

        f_m = symbolic_to_function(Pm_sym)
        f_n = symbolic_to_function(Pn_sym)

        integrand(x) = f_m(x) * f_n(x)
        # atol = absolute tolerance(絶対誤差許容値)、他に rtol = relative tolerance(相対誤差許容)
        I, err = quadgk(integrand, -1, 1, atol=1e-10) # GuadGKパッケージ

        expected = m == n ? 2 / (2n + 1) : 0

        @printf "⟨P_%d, P_%d⟩ = %.6f (expected %.6f)\n" m n I expected 
    end
end
