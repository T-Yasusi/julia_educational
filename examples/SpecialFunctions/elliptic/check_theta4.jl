import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions
using Printf

max_range = 5
delta = 0.1

function check_package(z, tau; atol = 0, rtol = 0, thre = 1e-4)
    val  = theta4(z, tau)
    val2 = EF.jtheta4(z*pi, exp(im*pi*tau) )
    if abs(val) < thre || abs(val2) < thre || abs(val) > 1/thre || abs(val2)> 1/thre
        return
    end
    
    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau)
        @printf "   > my impl = %f%+fi \n" real(val) imag(val)
        @printf "   > package = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
#        exit()
    end
end

# z = 0.5 + 0.0im
# tau = 0.0+5.0im
# check_package(-1.01-0.1im, -5.0+0.1im)
# check_package(-1.0-0.1im, -5.0+0.1im)
# check_package(-0.99-0.1im, -5.0+0.1im)
# check_package(0.1+5.0im, 0.0+0.5im)
# check_package(0.5+10.0im, 0.0+5.0im)
# check_package(2.5+10.0im, 0.0+5.0im)
# exit()

function check_periodic(z, tau; atol = 0, rtol = 0, thre = 1e-4)
    val  = theta4(z, tau)
    val2 = theta4(z+1, tau)
    if abs(val) < thre || abs(val2) < thre || abs(val) > 1/thre || abs(val2)> 1/thre
        return
    end
    
    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau)
        @printf "   > θ1(z, τ)   = %f%+fi \n" real(val) imag(val)
        @printf "   > θ1(z+1, τ) = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
    end
end

function check_quasi_periodic(z, tau; atol = 0, rtol =0, thre = 1e-4)
    val  = (-1)*exp(-pi*im*tau-2*pi*im*z)*theta4(z, tau)
    val2 = theta4(z+tau, tau)
    if abs(val) < thre || abs(val2) < thre || abs(val) > 1/thre || abs(val2)> 1/thre
        return
    end

    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau)
        @printf "   > f*θ1(z, τ) = %f%+fi \n" real(val) imag(val)
        @printf "   > θ1(z+τ, τ) = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
    end
end

function check_package_all(; atol, rtol)    
    println("##### Check by Package ####################################################################")
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

function check_periodic_all(; atol, rtol)
    println("##### Check using Priodic Condition ##########################################################")
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

function check_quasi_periodic_all(; atol, rtol)
    println("##### Check using Quasi-Priodic Condition ####################################################")
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

check_package_all(atol = 1e-4, rtol = 1e-4)
# check_periodic_all(atol = 1e-10, rtol = 1e-10)
# check_quasi_periodic_all(atol = 1e-12, rtol = 1e-12)



