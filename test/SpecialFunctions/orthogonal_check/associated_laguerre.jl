using Test
using Symbolics

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials
using .Educational.DoubleExponentialIntegration

@variables x
max_n = 5
tolerance = 1e-6

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Associated Laguerre Orthogonality" begin
    for n in 0:max_n
        for n2 in 0:max_n
            max_k = min(n, n2)
            for k in 0:max_k
                f1 = symbolic_to_function(associated_laguerre(n, k, x))
                f2 = symbolic_to_function(associated_laguerre(n2, k, x))
                val, _ = deint(x -> x^k * exp(-x) * f1(x) * f2(x), 0, Inf)
                expected = n == n2 ? factorial(n + k) / factorial(n) : 0.0
                @test isapprox(val, expected; atol=tolerance)
            end
        end
    end
end
