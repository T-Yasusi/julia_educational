function can_lower_op(pattern::Vector{Vector{Int}}, i::Int, j::Int)
    if pattern[i][j] > pattern[i-1][j+1]
        if j>=length(pattern[i]) || pattern[i][j] > pattern[i+1][j]
            return true
        end
    end
    return false
end
