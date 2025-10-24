function gram_schmidt(gt, irrep1, irrep2, expr_map)
#    println("===== Gram Schmidt =====")
#    println(gt)
    
    bais = Vector{Tuple{Vector{Vector{Int}}, Vector{Vector{Int}}}}()
    es = eigenvalues(gt)
    for i in 1:length(irrep1)
        for j in 1:length(irrep2)
            sum_eigen = eigenvalues(irrep1[i]) .+ eigenvalues(irrep2[j])
            if( es == sum_eigen )
                push!(bais, (irrep1[i], irrep2[j]))
            end
        end
    end
    vecs = []
    for i in 1:length(expr_map)
        for j in 1:length(expr_map[i])
            if es == eigenvalues(expr_map[i][j][1].gt1) .+ eigenvalues(expr_map[i][j][1].gt2)
                v = zeros(Float64, length(bais))
                for k in 1:length(expr_map[i][j])
                    ids = findall(x-> x[1] == expr_map[i][j][k].gt1 && x[2] == expr_map[i][j][k].gt2, bais)
                    v[ids[1]] = expr_map[i][j][k].coff
                end
                push!(vecs, v)
            end
        end
    end

    vec = zeros(Float64, length(vecs[1]))
    for j in 1:length(vecs[1])
        vec = zeros(Float64, length(vecs[1]))
        vec[j] = 1
        flag = true
        for i in 1:length(vecs)
            a = sum(vecs[i] .* vec)
            if( sum( [ e*e for e in vec .- a * vecs[i] ] ) < 1e-8 )
                flag = false
                break
            end
            vec = vec .- a * vecs[i]
        end

        a = sqrt(sum(vec .* vec))
        vec = [ v/a for v in vec ]
        
        if flag
            break
        end
    end

#    println("vec = ", vec)        
    expr = [ Term(vec[i], bais[i][1], bais[i][2]) for i in 1:length(bais) ]
    return summrize(expr)
end
