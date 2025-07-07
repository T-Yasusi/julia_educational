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

@testset "Hermite Orthogonality" begin
    for m in 0:max_n
        for n in 0:max_n
            Hm_sym = hermite(m, x)
            Hn_sym = hermite(n, x)

            f_m = symbolic_to_function(Hm_sym)
            f_n = symbolic_to_function(Hn_sym)

            integrand(x) = exp(-x^2) * f_m(x) * f_n(x)
            val, _ = deint(integrand, -Inf, Inf) 
        
            expected = m == n ? sqrt(pi) * 2^n * factorial(n) : 0
            @test isapprox(val, expected; atol=tolerance)
        end
    end
end
