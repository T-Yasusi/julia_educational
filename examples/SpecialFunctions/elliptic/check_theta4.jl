import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions
using Printf

const N = 50
const tau_re_max = 10
const tau_im_max = 10 
const dtau_re = 2*tau_re_max/N
const dtau_im = 2*tau_im_max/N
const dz_re = 2/N
const N_period = 10

function check_package(z, tau; atol = 0, rtol = 0, print = false)
    val  = theta4(z, tau)
    val2 = EF.jtheta4(z*pi, exp(im*pi*tau) )
    if print && ( abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2)) ) 
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau)
        @printf "   > my impl = %f%+fi \n" real(val) imag(val)
        @printf "   > package = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
    end
    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
        return false
    else
        return true
    end    
end

function check_periodic(z, tau; atol = 0, rtol = 0, print = false)
    val  = theta4(z, tau)
    val2 = theta4(z+1, tau)
    
    if print && ( abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2)) )
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau)
        @printf "   > θ1(z, τ)   = %f%+fi \n" real(val) imag(val)
        @printf "   > θ1(z+1, τ) = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
    end
    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2)) 
        return false
    else
        return true
    end
end

function check_quasi_periodic(z, tau; atol = 0, rtol = 0, print = false)
    val  = -1*exp(-pi*im*tau-2*pi*im*z)*theta4(z, tau)
    val2 = theta4(z+tau, tau)
    if abs(val) > 1e2 || abs(val2) > 1e2
        return true
    end

    if print && ( abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2)) )
        println("=====================================================================")
        @printf "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi \n" real(z) imag(z) real(tau) imag(tau) 
        @printf "   > f*θ1(z, τ) = %f%+fi \n" real(val) imag(val)
        @printf "   > θ1(z+τ, τ) = %f%+fi \n" real(val2) imag(val2)
        @printf "   > atol = %.3e  rtol = %.3e \n" abs(val-val2) abs(val-val2)/max(abs(val), abs(val2))
    end
    if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
        return false
    else
        return true
    end
end

function check_package_all(; atol = 0, rtol = 0, print = false)    
    println("##### Check by Package #######################################################################")
    n_check = 0
    n_error = 0    
    for tau_re in -tau_re_max: dtau_re: tau_re_max
        for tau_im in dtau_im: dtau_im: tau_im_max
            dz_im = 2*tau_im/N
            for z_re in -1: dz_re: 1
                for z_im in -tau_im: dtau_im: tau_im
                    n_check += 1
                    if !check_package(z_re+z_im*im, tau_re+tau_im*im, atol = atol, rtol = rtol, print = print)
                       n_error += 1
                    end
                end
            end 
        end
    end
    println("n check : ", n_check, "  n error : ", n_error)
end

function check_periodic_all(; atol = 0, rtol = 0, print = false)
    println("##### Check using Periodic Condition #########################################################")
    n_check = 0
    n_error = 0    
    for tau_re in -tau_re_max: dtau_re: tau_re_max
        for tau_im in dtau_im: dtau_im: tau_im_max
            dz_im = 2*tau_im/N
            for z_re in -1: dz_re: 1
                for z_im in -tau_im: dtau_im: tau_im
                    for n in -N_period: 1: N_period
                        if n == 0
                            continue
                        end
                        n_check += 1
                        if !check_periodic(z_re+z_im*im + n, tau_re+tau_im*im, atol = atol, rtol = rtol, print = print)
                            n_error += 1
                        end
                    end
                end
            end 
        end
    end
    println("n check : ", n_check, "  n error : ", n_error)
end

function check_quasi_periodic_all(; atol = 0, rtol = 0, print = false)
    println("##### Check using Quasi-Periodic Condition ###################################################")
    n_check = 0
    n_error = 0    
    for tau_re in -tau_re_max: dtau_re: tau_re_max
        for tau_im in dtau_im: dtau_im: tau_im_max
            dz_im = 2*tau_im/N
            for z_re in -1: dz_re: 1
                for z_im in -tau_im: dtau_im: tau_im
                    for n in -N_period: 1: N_period
                        if n == 0
                            continue
                        end
                        n_check += 1
                        tau = tau_re+tau_im*im
                        if !check_quasi_periodic(z_re+z_im*im + n*tau, tau, atol = atol, rtol = rtol, print = print)
                            n_error += 1
                        end
                    end
                end
            end 
        end
    end
    println("n check : ", n_check, "  n error : ", n_error)
end

check_package_all(atol =1e-12, rtol = 1e-12, print = true)
check_periodic_all(atol = 1e-13, rtol = 1e-13, print = true)
check_quasi_periodic_all(atol = 1e-4, rtol = 1e-4, print = false)



