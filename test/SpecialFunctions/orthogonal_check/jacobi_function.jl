module JacobiFunctionTest

using Symbolics
using QuadGK
using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.SpecialFunctions
using .Educational.DoubleExponentialIntegration

@variables x
max_n = 3 # 最大次数
tolerance = 1e-6
α = 2.5
β = 3.5

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Jacobi Function Orthogonality" begin
    for m in 0:max_n
        for n in 0:max_n
            Pm_sym = jacobi_function(m, α, β, x)
            Pn_sym = jacobi_function(n, α, β, x)

            f_m = symbolic_to_function(Pm_sym)
            f_n = symbolic_to_function(Pn_sym)

            integrand(x) = (1-x)^α * (1+x)^β * f_m(x) * f_n(x)
            val, _ =  quadgk(integrand, -1, 1)
        
            expected = m == n ? 2^(α+β+1)/(2n+α+β+1) *gamma(n+α+1) *gamma(n+β+1)/(factorial(n)*gamma(n+α+β+1)) : 0
            @test isapprox(val, expected; atol=tolerance)
        end
    end
end

end
