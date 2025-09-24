using Test
import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

const N = 10
const tau_re_max = 10
const tau_im_max = 10 
const dtau_re = 2*tau_re_max/N
const dtau_im = 2*tau_im_max/N
const dz_re = 2/N
const N_period = 10

function check_package(z, tau; atol = 0, rtol = 0)
    val  = theta4(z, tau)
    val2 = EF.jtheta4(z*pi, exp(im*pi*tau) )
    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_periodic(z, tau; atol = 0, rtol = 0)
    val  = theta4(z, tau)
    val2 = theta4(z+1, tau)
    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_quasi_periodic(z, tau; atol = 0, rtol = 0)
    val  = -1*exp(-pi*im*tau-2*pi*im*z)*theta4(z, tau)
    val2 = theta4(z+tau, tau)
    if !isfinite(val) || !isfinite(val2)
        return
    end
    @test isapprox(val, val2, atol=atol, rtol=rtol)
end

function check_package_all(; atol = 0, rtol = 0)    
    @testset "Elliptic theta4 function check using EllipticcFunctions package" begin
        for tau_re in -tau_re_max: dtau_re: tau_re_max
            for tau_im in dtau_im: dtau_im: tau_im_max
                dz_im = 2*tau_im/N
                for z_re in -1: dz_re: 1
                    for z_im in -tau_im: dtau_im: tau_im
                        check_package(z_re+z_im*im, tau_re+tau_im*im, atol = atol, rtol = rtol)
                    end
                end 
            end
        end
    end
end

function check_periodic_all(; atol = 0, rtol = 0)
    @testset "Elliptic theta4 function check using Peridodic Condition" begin
        for tau_re in -tau_re_max: dtau_re: tau_re_max
            for tau_im in dtau_im: dtau_im: tau_im_max
                dz_im = 2*tau_im/N
                for z_re in -1: dz_re: 1
                    for z_im in -tau_im: dtau_im: tau_im
                        for n in -N_period: 1: N_period
                            check_periodic(z_re+z_im*im + n, tau_re+tau_im*im, atol = atol, rtol = rtol)
                        end
                    end
                end 
            end
        end
    end
end

function check_quasi_periodic_all(; atol = 0, rtol = 0)
    @testset "Elliptic theta4 function check using Quasi-Peridodic Condition" begin
        for tau_re in -tau_re_max: dtau_re: tau_re_max
            for tau_im in dtau_im: dtau_im: tau_im_max
                dz_im = 2*tau_im/N
                for z_re in -1: dz_re: 1
                    for z_im in -tau_im: dtau_im: tau_im
                        for n in -N_period: 1: N_period
                            tau = tau_re+tau_im*im
                            check_quasi_periodic(z_re+z_im*im + n*tau, tau, atol = atol, rtol = rtol)
                        end
                    end
                end 
            end
        end
    end
end

check_package_all(atol = 1e-8, rtol = 1e-8)
check_periodic_all(atol = 1e-13, rtol = 1e-13)
check_quasi_periodic_all(atol = 1e-10, rtol = 1e-10)



