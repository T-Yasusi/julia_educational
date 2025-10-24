function weight_from_GT(gt::Vector{Vector{Int}})
    n = length(gt)
    μ = zeros(Int, n-1)
    for i in 1:(n-1)
        μ[i] = sum(gt[i]) - sum(gt[i+1])
    end
    return μ
end
