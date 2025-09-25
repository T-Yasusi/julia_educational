using Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

tolerance = 1.0e-11

@testset "Jacobi function by AGM method and theta" begin
    for u in -10: 0.1: 10
        for m in -5: 0.1: 5
            _, sn, cn, dn = jacobi_AGM(u, m)

            @test isapprox(sn, jacobi_sn_theta(u+0.0im, m+0.0im), atol=tolerance, rtol=0)
            @test isapprox(cn, jacobi_cn_theta(u+0.0im, m+0.0im), atol=tolerance, rtol=0)
            @test isapprox(dn, jacobi_dn_theta(u+0.0im, m+0.0im), atol=tolerance, rtol=0)
        end
    end
    
end
