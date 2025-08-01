function minus_one_to_one(f::Function; atol::Real, rtol::Real)
    phi(t) = tanh((pi/2) * sinh(t))
    dphi(t) = (pi/2) * cosh(t) / cosh(pi/2 * sinh(t))^2

    integrand(t) = f(phi(t)) * dphi(t)
    
    max_range = 1.5;
    while isinf(integrand(-max_range)) || isinf(integrand(max_range))
        max_range = 0.9*max_range
        if( max_range < 1.0e-2 )
            error("DE積分[-1:1]: コンバージョンしませんでした")
        end
    end

    range = 0.9*max_range
    step = 0.01*range
    val0 = trapezoid(integrand, -range, range)
#    val0, _ = quadgk(integrand, -range, range; atol = atol, rtol = rtol)
    range += step
#    val1, _ = quadgk(integrand, -range, range; atol = atol, rtol = rtol)
    val1 = trapezoid(integrand, -range, range)

    while abs(val1 - val0) > atol + rtol * abs(val1)
        range += step
        if( isinf(integrand(-range)) || isinf(integrand(range)) || isnan(integrand(-range)) || isnan(integrand(range)) )
            error("DE積分[-1:1]: コンバージョンしませんでした")
        end
        
        val0 = val1
#        val1, _ = quadgk(integrand, -range, range; atol = atol, rtol = rtol)
        val1 = trapezoid(integrand, -range, range)
    end

    return val1, abs( val0 - val1 )
end
