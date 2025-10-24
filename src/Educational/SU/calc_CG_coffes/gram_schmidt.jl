function gram_schmidt(gt, irrep1, irrep2, expr_map)
    println("===== Gram Schmidt =====")
    bais = Vector{Tuple{Vector{Vector{Int}}, Vector{Vector{Int}}}}()
    es = eigenvalues(gt)
    for i in 1:length(irrep1)
        for j in 1:length(irrep2)
            sum_eigen = eigenvalues(irrep1[i]) .+ eigenvalues(irrep2[j])
#            println(es, sum_eigen)
            if( es == sum_eigen )
                push!(bais, (irrep1[i], irrep2[j]))
            end
        end
    end
    vecs = []
    for i in 1:length(expr_map)
        for j in 1:length(expr_map[i])
            println(" i = ", i, " j = ", j, " : l = ", length(expr_map[i][j]))
            if es == eigenvalues(expr_map[i][j][1].gt1) .+ eigenvalues(expr_map[i][j][1].gt2)
#                println(to_string_ket(expr_map[i][j]))
#                println(expr_map[i][j][1].gt1)
#                println(expr_map[i][j][1].gt2)
                v = zeros(Float64, length(bais))
                for k in 1:length(expr_map[i][j])
                    ids = findall(x-> x[1] == expr_map[i][j][k].gt1 && x[2] == expr_map[i][j][k].gt2, bais)
                    v[ids[1]] = expr_map[i][j][k].coff
#                    println("i = ", i, " j = ", " id = ", ids)
                end
                push!(vecs, v)
            end
        end
    end

    println("matrix = ", vecs)
    vec = zeros(Float64, length(vecs[1]))
    vec[1] = 1
    for i in 1:length(vecs)
        vec = vec .- sum(vecs[i] .* vec) * vecs[i]
    end
    a = sqrt(sum(vec .* vec))
    vec = [ v/a for v in vec ]
    println(vec)
    
    expr = [ Term(vec[i], bais[i][1], bais[i][2]) for i in 1:length(bais) ]
    println(expr)
    return summrize(expr)
end
