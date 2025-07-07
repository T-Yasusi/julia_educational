module LaguerreTest

using Symbolics
using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.DoubleExponentialIntegration

@variables x
max_n = 5 # 最大次数
tolerance = 1.0e-6

function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Laguerre Orthogonality" begin
    for m in 0:max_n
        for n in 0:max_n
            Lm_sym = laguerre(m, x)
            Ln_sym = laguerre(n, x)

            f_m = symbolic_to_function(Lm_sym)
            f_n = symbolic_to_function(Ln_sym)

            integrand(x) = exp(-x) * f_m(x) * f_n(x)
            val, _ = deint(integrand, 0, Inf) 
        
            expected = m == n ? 1 : 0
            @test isapprox(val, expected; atol=tolerance)
        end
    end
end

end
