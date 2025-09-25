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
    
    if ( abs(sn-sn3) > tol && abs(sn-sn3)/max(abs(sn), abs(sn3)) > tol ) ||
       ( abs(cn-cn3) > tol && abs(cn-cn3)/max(abs(cn), abs(cn3)) > tol ) ||
       ( abs(dn-dn3) > tol && abs(dn-dn3)/max(abs(dn), abs(dn3)) > tol )
        if print
            println("u = ", u, " m = ", m)
            @printf "sn : %.5f  %.5f  %.3e %.3e \n" sn real(sn3) abs(sn-sn3) abs(sn-sn3)/max(abs(sn), abs(sn3))
            @printf "cn : %.5f  %.5f  %.3e %.3e \n" cn real(cn3) abs(cn-cn3) abs(cn-cn3)/max(abs(cn), abs(cn3))
            @printf "dn : %.5f  %.5f  %.3e %.3e \n" sn real(dn3) abs(dn-dn3) abs(dn-dn3)/max(abs(dn), abs(dn3))
            
        end
        return false
    else
        return true
    end
end

function check_jacobi_all(; tol = 1e-11)
    n_check = 0
    n_error = 0
    for u in -10: 0.1: 10
        for m in -5: 0.1: 5
            n_check += 1
            if !check_jacobi(u, m, tol=tol)
                n_error += 1
            end
        end
    end
    println("n check : ", n_check, "  n error : ", n_error)
end

check_jacobi_all()
        


