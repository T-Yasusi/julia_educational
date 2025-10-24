include("generate_GT_pattern.jl")
include("weight_from_GT.jl")
include("eign_from_GT.jl")
include("irrep_dimN.jl")
include("decompose_irrep.jl")
include("lower_op.jl")
include("eigenvalues.jl")
include("to_string_ket.jl")
include("calc_CG_coffes/next.jl")
include("calc_CG_coffes/Term.jl")
include("calc_CG_coffes/gram_schmidt.jl")

function calc_CG_coffes(w1::Vector{Int}, w2::Vector{Int})
    irrep1 = generate_GT_pattern(w1)
    irrep2 = generate_GT_pattern(w2)
    irreps = [ generate_GT_pattern(w) for w in decompose_irrep(irrep1, irrep2) ]
    
    total_dim = 0
    for irrep in irreps
        total_dim += length(irrep)
    end

    println("Calc CG coffecients")
    println("> dim N1 = ", length(irrep1))
    println("> dim N2 = ", length(irrep2))    
    println("> total dim = ", total_dim)

    expr_map = []
    exprs = fill(Vector{Term}(), length(irreps[1]))
    exprs[1] = [ Term(1.0, irrep1[1], irrep2[1]) ]

    for i in 2:length(irreps[1][1])
        next(irreps[1], irrep1, irrep2, [ Term(1.0, irrep1[1], irrep2[1]) ] , irreps[1][1], i, exprs)
    end
    for i in 1:length(irreps[1])
        println("i = ", i, "  ", irreps[1][i])
        println(to_string_ket(irreps[1][i]), " = ", to_string_ket(exprs[i]))
    end
    push!(expr_map, exprs)    

    for i in 2:length(irreps)
        top_expr = gram_schmidt(irreps[i][1], irrep1, irrep2, expr_map)
        println(" top_expr = ", to_string_ket(top_expr))
        exprs = fill(Vector{Term}(), length(irreps[i]))
        exprs[1] = top_expr
        for j in 2:length(irreps[i][1])
            println(irreps[i][1])
            next(irreps[i], irrep1, irrep2, top_expr , irreps[i][1], j, exprs)
        end
        for j in 1:length(irreps[i])
            println("i = ", j, "  ", irreps[i][j])
            println(to_string_ket(irreps[i][j]), " = ", to_string_ket(exprs[j]))
        end
        push!(expr_map, exprs)    
        
#        exit()
    end
#    println(gram_schmidt(irreps[2][1], irrep1, irrep2, expr_map)) 
    return
    
    bais = Vector{Tuple{Vector{Vector{Int}}, Vector{Vector{Int}}}}()
    es = eigenvalues(irreps[2][1])
    for i in 1:length(irrep1)
        for j in 1:length(irrep2)
            sum_eigen = eigenvalues(irrep1[i]) .+ eigenvalues(irrep2[j])
            println(es, sum_eigen)
            if( es == sum_eigen )
                push!(bais, (irrep1[i], irrep2[j]))
            end
        end
    end
    println(bais)
    for i in 1:length(bais)
        println(to_string_ket(bais[i][1]))
        println(to_string_ket(bais[i][2]))
    end
    
    vecs = []
    for i in 1:length(expr_map)
        for j in 1:length(expr_map[i])
            if es == eigenvalues(expr_map[i][j][1].gt1) .+ eigenvalues(expr_map[i][j][1].gt2)
                println(to_string_ket(expr_map[i][j]))                
                println(expr_map[i][j][1].gt1)
                println(expr_map[i][j][1].gt2)
                v = zeros(Float64, length(bais))
                for k in 1:length(expr_map[i][j])
                    ids = findall(x-> x[1] == expr_map[i][j][k].gt1 && x[2] == expr_map[i][j][k].gt2, bais)
                    v[ids[1]] = expr_map[i][j][k].coff
                    println("i = ", i, " j = ", " id = ", ids)
                end
                push!(vecs, v)
            end
        end
    end
    println(vecs)
    @assert length(vecs[1])-1 == length(vecs) "!!! Gram Schmidt matrix size not match !!!"
    vec = zeros(Float64, length(vecs[1]))
    vec[1] = 1
    for i in 1:length(vecs)
        vec = vec .- sum(vecs[i] .* vec) * vecs[i]
    end
    println(vec)
    a = sqrt(sum(vec .* vec))
    vec = [ v/a for v in vec ]
    println(bais)
    println(vec)
    
#    println(length(vs))
#    for i in 1:length(vs)
#        println(to_string_ket(vs[i]))
#    end
end

export calc_CG_coffes
