function besselj(ν::Symbolics.Num, z::Symbolics.Num)
    @variables t
    return ∫(exp(im * (ν*t - z*sin(t)) ), t-> (-pi, pi))/(2*pi)
end

function besselj(ν::Union{Real, Complex}, x::Real)
    return (quadgk(t -> cos(ν*t - x*sin(t)), 0, pi)[1] - sin(ν*pi) * deint(t -> exp(-x*sinh(t) - ν*t), 0, Inf)[1]) /pi
end

function besselj(ν::Union{Real, Complex}, z::Complex)
    return quadgk(t -> exp(im * (ν*t - z*sin(t)) ), -pi, pi)[1]/(2*pi)
end

function bessely(ν::Symbolics.Num, z::Symbolics.Num)
    return (besselj(ν, z)*cos(ν*pi) - besselj(-ν, z))/sin(ν*pi)
end

function bessely(n::Int, z::Union{Real, Complex})
    diff = (f::Function, x::Real, h::Real = 1e-8) -> (f(x+h)-f(x-h))/(2*h)

    return (diff(x-> besselj(x, z), n) - (-1)^n * diff(x-> besselj(-x, z), n))/pi
end

function bessely(ν::Union{Real, Complex}, z::Union{Real, Complex})
    return (besselj(ν, z)*cos(ν*pi) - besselj(-ν, z))/sin(ν*pi)
end

export besselj, bessely

