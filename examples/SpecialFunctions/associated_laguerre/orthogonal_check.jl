using Symbolics
using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.DoubleExponentialIntegration

@variables x
max_n = 5

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

for n in 0:max_n
    for n2 in 0:max_n
        max_k = n>n2 ? n2 : n
        for k in 0:max_k
            f1 = symbolic_to_function( associated_laguerre(n, k, x) )
            f2 = symbolic_to_function( associated_laguerre(n2, k, x) )
#            f1 = x -> associated_legendre(m, l, x) 
#            f2 = x -> associated_legendre(m, l2, x) 
            val, _ = deint( x -> x^k * exp(-x) * f1(x) * f2(x), 0, Inf)
            expected = n == n2 ? factorial(n+k) / factorial(n) : 0
            @printf "⟨P(%d, %d), P(%d, %d)⟩ = %.6f (expected %.6f)\n" n k n2 k val expected
        end
    end
end
            
