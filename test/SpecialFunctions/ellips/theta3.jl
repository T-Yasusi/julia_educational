using Test
import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

max_range = 5
delta = 0.25

function test_package(; atol = 1e-5, rtol = 1e-5)
    @testset "Elliptic theta3 function check using EllipticcFunctions package" begin        
        for tau_re in -10: 0.1: 10
            for tau_im in 0.1: 0.1: 10
                for z_re in -1: 0.1: 1
                    for z_im in -1: 0.1: 1
                        if z_im == 0
                            continue
                        end
                        z = z_re + z_im*im
                        tau = tau_re + tau_im*im
                        
                        val = theta3(z, tau)
                        val2 = EF.jtheta3(z*pi, exp(im*pi*tau))
                        @test isapprox(val, val2, atol=atol, rtol=rtol)
                    end
                end
            end
        end
    end
end

function test_periodic_condition(;atol, rtol)
    @testset "Elliptic theta3 function check Periodic Condition" begin
        for z_re in -max_range: delta: max_range
            for z_im in -max_range: delta: max_range
                for tau_re in -max_range: delta: max_range
                    for tau_im in delta: delta: max_range
                        z = z_re + z_im*im
                        tau = tau_re + tau_im*im
                        
                        val  = theta3(z, tau)
                        val2 = theta3(z+1, tau)
                        @test isapprox(val, val2, atol=atol, rtol=rtol)
                    end
                end
            end
        end
    end
end

function test_quasi_periodic_condition(;atol, rtol)
    @testset "Elliptic theta3 function check Quqsi-Periodic Condition" begin
        for z_re in -max_range: delta: max_range
            for z_im in -max_range: delta: max_range
                for tau_re in -max_range: delta: max_range
                    for tau_im in delta: delta: max_range
                        z = z_re + z_im*im
                        tau = tau_re + tau_im*im
                        
                        val  = exp(-pi*im*tau-2*pi*im*z)*theta3(z, tau)
                        val2 = theta3(z+tau, tau)
                        @test isapprox(val, val2, atol=atol, rtol=rtol)
                    end
                end
            end
        end
    end
end
        
test_package(atol=1e-5, rtol=1e-5)
test_periodic_condition(atol=1e-12, rtol=1e-12)
test_quasi_periodic_condition(atol=1e-10, rtol=1e-10)
