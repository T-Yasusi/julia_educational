using Roots, QuadGK, Test

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions
using .Educational.DoubleExponentialIntegration
using .Educational.Integration

const N = 10
const m = 0
const step = 1.0

const atol = 1e-6

@testset "Bessel Function Orthogonal Check" begin
    function search_zero(nu, n)
        as = []
        x = step;
        while length(as) < n
            #    println(bessel(nu, x), "  ", bessel(nu, x+step))        
            while bessel(nu, x)*bessel(nu, x+step)>0
                x += step
            end
            push!(as, find_zero(x2-> bessel(nu, x2), x))
            x += step
            #        println(as)
        end
        return as
    end
    
    function check_orthogonal(nu, as)
        for i in 1:length(as)
            for j in 1:length(as)
                #            println(as[i], "  ",as[j])
                #            val, _ = quadgk(x -> x*bessel(nu, as[i]*x)*bessel(nu, as[j]*x), 0.0, 1.0)
                val = simpson(x -> x*bessel(nu, as[i]*x)*bessel(nu, as[j]*x), 0.0, 1.0, 100)
                val2 = i == j ? (bessel(nu+1, as[i]))^2/2 : 0
                @test isapprox(val, val2, atol = atol)
            end
        end
    end
    as = search_zero(m, N)
    # println(as)
    check_orthogonal(m, as)
end

