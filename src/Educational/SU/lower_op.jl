include("can_lower_op.jl")

function lower_op_coff(gt, i, j)
#    println("> calc_lower_op i = ", i, " j = ", j, "\n", gt)
    deno = 1
    for k in 1:length(gt[i])
        if j == k
            continue
        end
        deno *= (gt[i][k] - gt[i][j] + j - k + 1) * (gt[i][k] - gt[i][j] + j - k)                
    end
    num1 = 1
    for k in 1:length(gt[i-1])
        num1 *= (gt[i-1][k] - gt[i][j] + j - k + 1)
    end
    num2 = 1
    if i<length(gt)
        for k in 1:length(gt[i+1])
            num2 *= (gt[i+1][k] - gt[i][j] + j - k)
        end
    end
#    println(num1, " * ", num2, " / ", deno)

    return sqrt(-num1*num2 / deno)
end

function lower_op(gt, i, gts)
#    println("lower op i = ", i, "\n", gt)
    coffs, indexes = [], []
    
    expr = 0
    for j in 1:length(gt[i])        
        coff = lower_op_coff(gt, i, j)
#        println("   > j = ", j, " coff = ", coff)
        if coff != 0 && !isnan(coff)
            gt2 = deepcopy(gt)
            gt2[i][j] -= 1
            index = findall(x -> x == gt2, gts)
#            println(index[1], "\n", gts[index[1]])
            push!(coffs, coff)
            push!(indexes, index[1])
        end
    end
    return coffs, indexes
end
