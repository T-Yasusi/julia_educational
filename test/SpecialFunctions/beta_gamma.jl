module BetaGammaTest

using Test

include("../../src/Educational.jl")
using .Educational.SpecialFunctions

real_parts = range(0.5, step=1.0, length=5)
imag_parts = range(0.5, step=1.0, length=5)
zz1 = [ Complex(re, im) for re in real_parts, im in imag_parts ]
zz2 = [ Complex(re, im) for re in real_parts, im in imag_parts ]
tolerance = 1e-6

@testset "Beta-Gamma Relation" begin
    for z1 in zz1
        for z2 in zz2
#            println("z1 = ", z1, "  z2 = ",z2)
            @test isapprox(beta(z1, z2), gamma(z1)*gamma(z2)/gamma(z1+z2); atol = tolerance, rtol = tolerance)
        end
    end
end

end
