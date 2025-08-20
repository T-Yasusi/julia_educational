using Test 
import Elliptic.Jacobi

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

tolerance = 1.0e-6

@testset "Jacobi function by AGM check using Elliptic Package" begin
    for x in -100: 0.1: 100
        for m in -5: 0.1: 5
            @test isapprox(Jacobi.sn(x, m), jacobi_sn_AGM(x, m); atol=tolerance, rtol=0)
            @test isapprox(Jacobi.cn(x, m), jacobi_cn_AGM(x, m); atol=tolerance, rtol=0)
            @test isapprox(Jacobi.dn(x, m), jacobi_dn_AGM(x, m); atol=tolerance, rtol=0)
        end
    end
end
