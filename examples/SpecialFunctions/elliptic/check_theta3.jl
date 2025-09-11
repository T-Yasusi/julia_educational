import EllipticFunctions as EF

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions
using Printf

atol = 1e-6
rtol = 1e-6
max_range = 5
delta = 0.25

# z   = 4.5 + 5.0im
# tau = 4.0 + 2.0im
# val_pack = EF.jtheta1(z*pi, exp(im*pi*tau))
# val      = theta1(z, tau)

# val  = exp(-pi*im*tau-2*pi*im*z)*theta3(z, tau)
# val2  = theta3(z+tau, tau)
# # val2 = EF.jtheta3(z*pi, exp(im*pi*tau))
# println(" val(my impl) = ", val)
# println(" θ(z+τ, τ)    = ", val2)
# # println(" val(my impl) = ", theta3(z+1, tau))
# println(" val(package) = ", val_pack)
# # println(" val(package) = ", EF.jtheta3((z+1)*pi, exp(im*pi*tau)))
# exit();

println("##### Check by Package ####################################################################")
for tau_re in -10: 0.1: 10
    for tau_im in 0.1: 0.1: 10
        for z_re in -1: 0.1: 1
            for z_im in -1: 0.1: 1
                if z_im == 0
                    continue
                end
                z = z_re + z_im*im
                tau = tau_re + tau_im*im
                val  = theta3(z, tau)
                val2 = EF.jtheta3(z*pi, exp(im*pi*tau) )
                if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2)) 
                    @printf("> z = %6.3f%+.3fi  τ = %6.3f%+.3fi   theta3 = %f%+fi   package = %f%+fi   δ = %e \n",
                            real(z), imag(z), real(tau), imag(tau), real(val), imag(val), real(val2), imag(val2), abs(val-val2))
                end
            end
        end
    end
end

println("##### Check by Priodic Condition ##########################################################")
for z_re in -max_range: delta: max_range
    for z_im in -max_range: delta: max_range
        for tau_re in -max_range: delta: max_range
            for tau_im in delta: delta: max_range
                z = z_re + z_im*im
                tau = tau_re + tau_im*im
                val  = theta3(z, tau)
                val2 = theta3(z+1, tau)
                if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
                    @printf( "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi   θ3(z, τ) = %f%+fi   θ3(z+1, τ) = %f%+fi   δ = %e \n",
                            real(z), imag(z), real(tau), imag(tau), real(val), imag(val), real(val2), imag(val2), abs(val-val2))
                end
            end
        end
    end
end

println("##### Check by Quasi Priodic Condition ####################################################")
for z_re in -max_range: delta: max_range
    for z_im in -max_range: delta: max_range
        for tau_re in -max_range: delta: max_range
            for tau_im in delta: delta: max_range
                z = z_re + z_im*im
                tau = tau_re + tau_im*im
                val  = exp(-pi*im*tau-2*pi*im*z)*theta3(z, tau)
                val2 = theta3(z+tau, tau)
                if abs(val-val2) > atol && abs(val-val2) > rtol*max(abs(val), abs(val2))
                    @printf( "   > z = %6.3f%+.3fi  τ = %6.3f%+.3fi   factor*θ3(z, τ) = %f%+fi   θ3(z+τ, τ) = %f%+fi   δ = %e \n",
                            real(z), imag(z), real(tau), imag(tau), real(val), imag(val), real(val2), imag(val2), abs(val-val2))
                end
            end
        end
    end
end
