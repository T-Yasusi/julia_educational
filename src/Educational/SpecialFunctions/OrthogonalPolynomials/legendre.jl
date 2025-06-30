function legendre(n::Int)
    @assert n ≥ 0 "n must be non-negative"
    @variables x
    return legendre(n, x)
end

function legendre(n::Int, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return z
    return ((2n - 1)*z*legendre(n - 1, z) - (n - 1)*legendre(n - 2, z)) / n
end

function legendre(n::Int, z::Symbolics.Num)
    n == 0 && return 1
    n == 1 && return z
    return ((2n - 1)*z*legendre(n - 1, z) - (n - 1)*legendre(n - 2, z)) / n
end
