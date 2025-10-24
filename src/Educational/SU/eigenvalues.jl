function eigenvalues(gt::Vector{Vector{Int}})
    values = []
    for i in 2:length(gt)-1
        push!(values, (2*sum(gt[i])-(sum(gt[i-1])+sum(gt[i+1]))) / 2)
    end
    push!(values, (2*sum(gt[length(gt)])-(sum(gt[length(gt)-1]))) / 2)
    return values
end
