function eign_from_GT(gt::Vector{Vector{Int}})
    n = length(gt)
    eign = zeros(Real, n-1)
    eign[1] = sum(gt[1]) - sum(gt[2])/2
    for i in 2:(n-1)
        eign[i] = sum(gt[i]) - (sum(gt[i-1])+sum(gt[i+1]))/2
    end
    return eign
end
