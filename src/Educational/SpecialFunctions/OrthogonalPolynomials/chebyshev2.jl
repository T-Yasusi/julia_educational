function chebyshev2(n::Int)
    @assert n ≥ 0 "n must be non-negative"
    @variables x
    return chebyshev2(n, x)
end

function chebyshev2(n::Int, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return 2z
    return 2z * chebyshev2(n - 1, z) - chebyshev2(n - 2, z)
end

function chebyshev2(n::Int, z::Symbolics.Num)
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return 1
    n == 1 && return 2z
    return 2z * chebyshev2(n - 1, z) - chebyshev2(n - 2, z)
end
