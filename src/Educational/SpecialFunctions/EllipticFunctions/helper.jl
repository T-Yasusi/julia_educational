function AGM_am(u::Float64, m::Float64, tol=e-14)
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
    return phi
end

export AGM_am
