using Symbolics
using QuadGK
using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x
max_n = 5 # 最大次数
tolerance = 1e-6

function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Legendre Orthogonality" begin
    for m in 0:max_n
        for n in 0:max_n
            Pm_sym = legendre(m, x)
            Pn_sym = legendre(n, x)

            f_m = symbolic_to_function(Pm_sym)
            f_n = symbolic_to_function(Pn_sym)

            integrand(x) = f_m(x) * f_n(x)
            val, _ = quadgk(integrand, -1, 1, atol=1e-10) # GuadGKパッケージ

            expected = m == n ? 2 / (2n + 1) : 0
            @test isapprox(val, expected; atol=tolerance)          
        end
    end
end







