using Test
import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

max_range = 5
delta = 0.25

function check_package(z, tau; atol, rtol)
    val  = theta1(z, tau)
    val2 = EF.jtheta1(z*pi, exp(im*pi*tau) )
    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_periodic(z, tau; atol, rtol)
    val  = theta1(z, tau)
    val2 = -1*theta1(z+1, tau)
    if isnan(val) || isnan(val2) || isinf(val) || isinf(val2)
        return
    end
    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_quasi_periodic(z, tau; atol, rtol)
    val  = -1*exp(-pi*im*tau-2*pi*im*z)*theta1(z, tau)
    val2 = theta1(z+tau, tau)
    if abs(val)>1e2 || abs(val2)>1e2
        return
    end

    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_package_all(; atol, rtol)    
    @testset "Elliptic theta1 function check using EllipticcFunctions package" begin
        for tau_re in -max_range: delta: max_range
            for tau_im in delta: delta: 10
                for z_re in -1: delta: 1
                    for z_im in -tau_im: delta: tau_im
                        check_package(z_re+z_im*im, tau_re+tau_im*im, atol = atol, rtol = rtol)
                    end
                end 
            end
        end
    end
end

function check_periodic_all(; atol, rtol)
    @testset "Elliptic theta1 function check using Peridodic Condition" begin
        for tau_re in -max_range: delta: max_range
            for tau_im in delta: delta: max_range
                for z_re in -max_range-0.5*delta: delta: max_range+0.5*delta
                    for z_im in -max_range-0.5*delta: delta: max_range+0.5*delta
                        check_periodic(z_re+z_im*im, tau_re+tau_im*im, atol = atol, rtol = rtol)
                    end
                end 
            end
        end
    end
end

function check_quasi_periodic_all(; atol, rtol)
    @testset "Elliptic theta1 function check using Quasi-Peridodic Condition" begin
        for tau_re in -max_range: delta: max_range
            for tau_im in delta: delta: max_range
                for z_re in -max_range-0.5*delta: delta: max_range+0.5*delta
                    for z_im in -max_range-0.5*delta: delta: max_range+0.5*delta
                        check_quasi_periodic(z_re+z_im*im, tau_re+tau_im*im, atol = atol, rtol = rtol)
                    end
                end 
            end
        end
    end
end
    
check_package_all(atol = 1e-4, rtol = 1e-4)
check_periodic_all(atol = 1e-10, rtol = 1e-10)
check_quasi_periodic_all(atol = 1e-12, rtol = 1e-12)



