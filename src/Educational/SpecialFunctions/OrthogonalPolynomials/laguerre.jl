function laguerre(n::Int)
    @assert n ≥ 0 "n must be non-negative"
    @variables x
    return laguerre(n, x)
end

function laguerre(n::Int, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return 1 - z
    return ((2n - 1 - z) * laguerre(n - 1, z) - (n - 1) * laguerre(n - 2, z)) / n
end

function laguerre(n::Int, z::Symbolics.Num)
    n == 0 && return 1
    n == 1 && return 1 - z
    return ((2n - 1 - z) * laguerre(n - 1, z) - (n - 1) * laguerre(n - 2, z)) / n
end
