module Faddeeva

using Test

include("../../src/Educational.jl")
using .Educational.SpecialFunctions

# 実部・虚部のテスト範囲
real_parts = range(0.5, step=1.0, length=5)
imag_parts = range(0.5, step=1.0, length=5)

tolerance = 1e-6

@testset "Faddeeva Identity Checks" begin
    for z in [Complex(re, im) for re in real_parts, im in imag_parts]
        lhs1 = faddeeva(z) + faddeeva(-z)
        rhs1 = 2 * exp(-z^2)
        @test isapprox(lhs1, rhs1; atol=tolerance, rtol=0)

        lhs2 = faddeeva(-z)
        rhs2 = conj(faddeeva(conj(z)))
        @test isapprox(lhs2, rhs2; atol=tolerance, rtol=0)
    end
end

end
