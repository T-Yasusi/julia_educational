function bessel(ν::Symbolics.Num, z::Symbolics.Num)
    @variables t
    return ∫(exp(im * (ν*t - z*sin(t)) ), t-> (-pi, pi))/(2*pi)
end

function bessel(ν::Union{Real, Complex}, x::Real)
    if x == 0
        return ν == 0 ? 1 : 0
    end
    return (quadgk(t -> cos(ν*t - x*sin(t)), 0, pi)[1] - sin(ν*pi) * deint(t -> exp(-x*sinh(t) - ν*t), 0, Inf)[1]) /pi
end

function bessel(ν::Union{Real, Complex}, z::Complex)
    return quadgk(t -> exp(im * (ν*t - z*sin(t)) ), -pi, pi)[1]/(2*pi)
end

function hankel(ν::Symbolics.Num, z::Symbolics.Num)
    return (bessel(ν, z)*cos(ν*pi) - bessel(-ν, z))/sin(ν*pi)
end

function hankel(n::Int, z::Union{Real, Complex})
    diff = (f::Function, x::Real, h::Real = 1e-8) -> (f(x+h)-f(x-h))/(2*h)

    return (diff(x-> bessel(x, z), n) - (-1)^n * diff(x-> bessel(-x, z), n))/pi
end

function hankel(ν::Union{Real, Complex}, z::Union{Real, Complex})
    return (bessel(ν, z)*cos(ν*pi) - bessel(-ν, z))/sin(ν*pi)
end

export bessel, hankel

