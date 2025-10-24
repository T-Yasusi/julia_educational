function irrep_dimN(weights::Vector{Int})::Int
    N = length(weights)
    dim = 1.0
    for i in 1:N-1
        for j in i+1:N
            dim *= (weights[i] - weights[j] + j - i) / (j - i)
        end
    end
    return round(Int, dim)
end
