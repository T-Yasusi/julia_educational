function chebyshev1(n::Int)
    @assert n ≥ 0 "n must be non-negative"
    @variables x
    return chebyshev1(n, x)
end

function chebyshev1(n::Int, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return z
    return 2z * chebyshev1(n - 1, z) - chebyshev1(n - 2, z)
end

function chebyshev1(n::Int, z::Symbolics.Num)
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return 1
    n == 1 && return z
    return 2z * chebyshev1(n - 1, z) - chebyshev1(n - 2, z)
end
