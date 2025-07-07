function erf(z::Symbolics.Num)
    @variables t
    return (2 / sqrt(π)) * ∫(exp(-t^2), t -> (0, z))
end

function erf(x::Union{Real, Complex})
    f(t) = exp(-t^2)
    val, _ = quadgk(f, 0, x)
    return (2 / sqrt(π)) * val
end
