function arc_integral(f::Function, R::Real, θ0::Real, θ1::Real; atol=1e-8, rtol=1e-6)
    g(θ) = f(R * exp(im * θ)) * im * R *exp(im * θ)
    return quadgk(g, θ0, θ1, atol, rtol)
end
