using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

function check_jacobi(u, m; tol=1e-12, print = true)
    _, sn, cn, dn = jacobi_AGM(u, m)

    sn3 = jacobi_sn_theta(u+0.0im, m+0.0im)
    cn3 = jacobi_cn_theta(u+0.0im, m+0.0im)
    dn3 = jacobi_dn_theta(u+0.0im, m+0.0im)
    if abs(imag(sn3)) > tol || abs(imag(cn3)) > tol || abs(imag(dn3)) > tol
        error("jacobi_theta return imaginary number")
    end
            println("u = ", u, " m = ", m)
            @printf "sn : %.5f  %.5f  %.3e %.3e \n" sn real(sn3) abs(sn-sn3) abs(sn-sn3)/max(abs(sn), abs(sn3))
            @printf "cn : %.5f  %.5f  %.3e %.3e \n" cn real(cn3) abs(cn-cn3) abs(cn-cn3)/max(abs(cn), abs(cn3))
            @printf "dn : %.5f  %.5f  %.3e %.3e \n" sn real(dn3) abs(dn-dn3) abs(dn-dn3)/max(abs(dn), abs(dn3))
    
    if ( abs(sn-sn3) > tol && abs(sn-sn3)/max(abs(sn), abs(sn3)) > tol ) ||
       ( abs(cn-cn3) > tol && abs(cn-cn3)/max(abs(cn), abs(cn3)) > tol ) ||
       ( abs(dn-dn3) > tol && abs(dn-dn3)/max(abs(dn), abs(dn3)) > tol )
        if print
        end
        return false
    else
        return true
    end
end

u = 0.0
m = 0.001
check_jacobi(u, m)
