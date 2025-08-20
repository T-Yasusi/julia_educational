function jacobi_AGM(u::Float64, m::Float64, tol=1.0e-14)
    @assert  m <= 1.0 "Jacobi elliptic function by AGM m must satisfy m <= 1"
    # 特殊ケース
    if m == 0.0
        return (u, sin(u), cos(u), 1.0)
    elseif m == 1.0
        return (u, tanh(u), 1/cosh(u), 1/cosh(u))
    end

    # AGM計算
    a, g = 1.0, sqrt(1.0 - m)
    as, cs = Float64[], Float64[]
    while abs(a - g) > tol
        push!(cs, (a - g) / 2)
        a, g = (a + g) /2 ,sqrt(a * g)
        push!(as, a)
    end

    # Landen再帰
    phi = 2^(length(as)) * a * u
    for i in length(as): -1: 1
        phi = 0.5*(phi + asin((cs[i]/as[i])*sin(phi)))
    end
    
    return (phi, sin(phi), cos(phi), sqrt(1-m*sin(phi)^2))
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
