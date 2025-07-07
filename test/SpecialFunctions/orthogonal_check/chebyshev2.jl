module Chebyshev2Test

using Symbolics
using QuadGK
using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x
max_n = 5 # 最大次数
tolerance = 1e-6

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Chebyshev2 Orthogonality" begin
    for m in 0:max_n
        for n in 0:max_n
            Um_sym = chebyshev2(m, x)
            Un_sym = chebyshev2(n, x)

            f_m = symbolic_to_function(Um_sym)
            f_n = symbolic_to_function(Un_sym)

            integrand(x) = f_m(x) * f_n(x) * sqrt(1 - x^2)
            # atol = absolute tolerance(絶対誤差許容値)、他に rtol = relative tolerance(相対誤差許容)
           val, _ = quadgk(integrand, -1, 1, atol=1e-10) # GuadGKパッケージ

            expected = m == n ? pi/2 : 0

            @test isapprox(val, expected; atol=tolerance)
        end
    end
end

end
