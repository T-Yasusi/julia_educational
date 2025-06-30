function hermite(n::Int)
    @assert n ≥ 0 "n must be non-negative"
    @variables x
    return hermite(n, x)
end

function hermite(n::Int, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return 2z
    return 2z * hermite(n - 1, z) - 2(n - 1) * hermite(n - 2, z)
end

function hermite(n::Int, z::Symbolics.Num)
    n == 0 && return 1
    n == 1 && return 2z
    return 2z * hermite(n - 1, z) - 2(n - 1) * hermite(n - 2, z)
end
