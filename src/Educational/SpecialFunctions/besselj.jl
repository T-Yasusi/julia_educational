function besselj(ν::Symbolics.Num, z::Symbolics.Num)
    @variables t
    return ∫(exp(im * (ν*t - z*sin(t)) ), t-> (-pi, pi))/(2*pi)
end

function besselj(ν::Union{Real, Complex}, x::Real)
    return quadgk(t -> cos(ν*t - x*sin(t)), 0, pi)[1]
end
    
function besselj(ν::Union{Real, Complex}, z::Union{Real, Complex})
    return quadgk(t -> exp(im * (ν*t - z*sin(t)) ), -pi, pi)[1]
end
