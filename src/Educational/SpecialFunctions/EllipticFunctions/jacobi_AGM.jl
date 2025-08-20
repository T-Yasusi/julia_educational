include("helper.jl")

function modular_change(u, m)
    if 1<m
        return u*sqrt(m), 1/m
    else
        return u, m
    end
end

function jacobi_AGM(u::Float64, m::Float64, tol=1.0e-14)
    # 特殊ケース
    if m == 0.0
        return (u, sin(u), cos(u), 1.0)
    elseif m == 1.0
        return (u, tanh(u), 1/cosh(u), 1/cosh(u))
    end
    phi = AGM_am(modular_change(u, m)..., tol)

    if m>1
        return ( phi, sin(phi)/sqrt(m), sqrt(1 - sin(phi)^2/m), cos(phi) )
    else
        return ( phi, sin(phi), cos(phi), sqrt(1-m*sin(phi)^2) )
    end
end

function jacobi_am_AGM(u::Float64, m::Float64, tol=1e-14)
    return jacobi_AGM(u, m)[1]
end

function jacobi_sn_AGM(u::Float64, m::Float64, tol=1e-14)
    return jacobi_AGM(u, m)[2]
end

function jacobi_cn_AGM(u::Float64, m::Float64, tol=1e-14)
    return jacobi_AGM(u, m)[3]
end

function jacobi_dn_AGM(u::Float64, m::Float64, tol=1e-14)
    return jacobi_AGM(u, m)[4]
end

export jacobi_AGM, jacobi_am_AGM, jacobi_sn_AGM, jacobi_cn_AGM, jacobi_dn_AGM
