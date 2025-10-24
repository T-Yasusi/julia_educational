function decompose_irrep(irrep1, irrep2)
    if length(irrep1) < length(irrep2)
        irrep1, irrep2 = irrep2, irrep1
    end

    top_weights = Vector{Vector{Int}}()
    for gt in irrep2
        b = deepcopy(gt)
        for i in 1:length(gt)-1
            for j in 1:length(gt[i])-1
                b[i][j] -= gt[i+1][j]
            end
        end
        
        t = deepcopy(irrep1[1][1])
        flag = true
        for j in 1:length(gt)
            for i in 1:length(gt[j])
                i2 = length(t)+1-i
                t[i2] += b[i][j]
                if i2>1 && t[i2-1]<t[i2]
#                    println("   >>> Discard thie pattern")
                    flag = false
                    break
                end
            end
            if !flag
                break
            end
        end
        if flag
            t = [ t[i]-t[end] for i in 1:length(t) ]
#            println("Add Irrep  t = ", t)
            push!(top_weights, t)
        end
    end
    sort!(top_weights, rev=true)
    
    return top_weights
end
