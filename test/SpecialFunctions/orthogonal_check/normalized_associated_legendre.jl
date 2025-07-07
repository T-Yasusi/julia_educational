module NormalizedAssociatedLegendreTest

using Symbolics
using QuadGK
using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x
max_l = 5
tolerance = 1e-6

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

@testset "Normalized Associated Legendre Orthogonality" begin
    for l in 0:max_l
        for l2 in 0:max_l
            max_m = l>l2 ? l2 : l
            for m in -max_m:max_m
                f1 = symbolic_to_function( normalized_associated_legendre(m, l, x) )
                f2 = symbolic_to_function( normalized_associated_legendre(m, l2, x) )
                
                val, _ = quadgk( x-> f1(x) * f2(x), -1, 1)
                expected = l == l2 ? 1 : 0

                @test isapprox(val, expected; atol = tolerance)
            end
        end
    end
end
    
end
