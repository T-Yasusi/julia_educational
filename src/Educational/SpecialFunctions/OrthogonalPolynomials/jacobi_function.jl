function jacobi_function(n::Int, α::Real, β::Real)
    @variables x
    return jacobiP(n, α, β, x)
end

function jacobi_function(n::Int, α::Real, β::Real, z::Symbolics.Num)
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return 1
    n == 1 && return 0.5 * ( 2*(α + 1) + (α + β +2)*(z - 1) )
    A = 2n * (n + α + β) * (2n + α + β - 2)
    B = (2n + α + β - 1) * (α^2 - β^2)
    C = (2n + α + β - 1) * (2n + α + β ) * (2n + α + β +-2)
    D = 2 * (n + α -1) * (n + β -1) * (2n + α + β)
    return ((B + C * z) * jacobi_function(n-1, α, β, z) - D * jacobi_function(n-2, α, β, z))/A
end

function jacobiP(n::Int, α::Real, β::Real, z::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    n == 0 && return one(z)
    n == 1 && return 0.5 * ( 2*(α + 1) + (α + β +2)*(z - 1) )
    A = 2n * (n + α + β) * (2n + α + β - 2)
    B = (2n + α + β - 1) * (α^2 - β^2)
    C = (2n + α + β - 1) * (2n + α + β ) * (2n + α + β +-2)
    D = 2 * (n + α -1) * (n + β -1) * (2n + α + β)
    return ((B + C * z ) * jacobi_function(n-1, α, β, z) - D * jacobi_function(n-2, α, β, z))/A
end
