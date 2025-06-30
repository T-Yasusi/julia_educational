using Symbolics
using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.DoubleExponentialIntegration

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
        Lm_sym = laguerre(m, x)
        Ln_sym = laguerre(n, x)

        f_m = symbolic_to_function(Lm_sym)
        f_n = symbolic_to_function(Ln_sym)

        integrand(x) = exp(-x) * f_m(x) * f_n(x)
        I, err = deint(integrand, 0, Inf) 
        
        expected = m == n ? 1 : 0

        @printf "⟨P_%d, P_%d⟩ = %.6f (expected %.6f)\n" m n I expected
    end
end
