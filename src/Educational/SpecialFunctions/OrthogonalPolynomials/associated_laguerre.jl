function associated_laguerre(n::Int, k::Int)
    @assert n ≥ 0 "n must be non-negative"
    @assert k ≥ 0 "k must be non-negative"
    @variables x
    return associated_laguerre(n, k, x)
end

function associated_laguerre(n::Int, k::Int, x::Union{Real, Complex})
    @assert n ≥ 0 "n must be non-negative"
    @assert k ≥ 0 "k must be non-negative"

    if n == 0
        return one(x)
    elseif n == 1
        return -x + k + 1
    end

    Lnm2 = one(x)
    Lnm1 = -x + k + 1

    for i in 2:n
        Ln = ((2i - 1 + k - x) * Lnm1 - (i - 1 + k) * Lnm2) / i
        Lnm2, Lnm1 = Lnm1, Ln
    end

    return Lnm1
end

function associated_laguerre(n::Int, k::Int, x::Symbolics.Num)
    if n == 0
        return 1
    elseif n == 1
        return -x + k + 1
    end

    Lnm2 = 1
    Lnm1 = -x + k + 1

    for i in 2:n
        Ln = ((2i - 1 + k - x) * Lnm1 - (i - 1 + k) * Lnm2) / i
        Lnm2, Lnm1 = Lnm1, Ln
    end

    return Lnm1
end
