function erf(z::Symbolics.Num)
    @variables t
    return exp(-z^2) * (1 + (2im / sqrt(pi)) * ∫exp(z^2), t -> (0, z))
end

function faddeeva(z::Union{ Real, Complex })
    integrand(s) = exp((s * z)^2) * z  # t = sz, dt = z ds
    I, _ = quadgk(integrand, 0, 1)
    return exp(-z^2) * (1 + (2im / sqrt(pi)) * I)
end
