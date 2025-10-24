include("irrep_dimN.jl")
include("weight_from_GT.jl")
include("can_lower_op.jl")

function generate(result, pattern)
    for i in 2: length(pattern)
        for j in length(pattern[i]): -1: 1
            if can_lower_op(pattern, i, j)
                new_pattern = deepcopy(pattern)
                new_pattern[i][j] -= 1
                if !any(x-> x == new_pattern, result)
                    push!(result, deepcopy(new_pattern))
                    generate(result, new_pattern)
                end
            end
        end
    end
end

function generate_GT_pattern(weight::Vector{Int})
#    println("===== Generate GT Pattern START  =====")
    result = Vector{Vector{Vector{Int}}}()
    gt_pattern = [ weight[1:i] for i in length(weight):-1:1] #最高ウェイト状態
    push!(result, deepcopy(gt_pattern))

    generate(result, gt_pattern)
    unique!(result)    
#    println("===== Generate GT Pattern FINISH =====")

    @assert length(result) == irrep_dimN(weight) "generate_GT_pattern::Not match irrep dimension"
    sort!(result, rev=true)
    #    sort!(result; lt = (a, b)-> is_less(a, b))

    return result # GTパターンの配列
end

export generate_GT_pattern
