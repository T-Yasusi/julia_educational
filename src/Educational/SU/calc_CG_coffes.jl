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
include("calc_CG_coffes/check_irrep_decomposition.jl")
include("calc_CG_coffes/check_decomposition.jl")

function calc_CG_coffes(w1::Vector{Int}, w2::Vector{Int})
    irrep1 = generate_GT_pattern(w1)
    irrep2 = generate_GT_pattern(w2)
    irreps = [ generate_GT_pattern(w) for w in decompose_irrep(irrep1, irrep2) ]
    
    check_irrep_decomposition(irreps, irrep1, irrep2)

    expr_map = []
    exprs = fill(Vector{Term}(), length(irreps[1]))
    exprs[1] = [ Term(1.0, irrep1[1], irrep2[1]) ]    
    for i in 2:length(irreps[1][1])
        next(irreps[1], irrep1, irrep2, [ Term(1.0, irrep1[1], irrep2[1]) ] , irreps[1][1], i, exprs)
    end
    
    check_decomposition(irreps[1], exprs)
    push!(expr_map, exprs)    

    for i in 2:length(irreps)
        top_expr = gram_schmidt(irreps[i][1], irrep1, irrep2, expr_map)
#        println(" top_expr = ", to_string_ket(top_expr))
        
        exprs = fill(Vector{Term}(), length(irreps[i]))
        exprs[1] = top_expr
        for j in 2:length(irreps[i][1])
            next(irreps[i], irrep1, irrep2, top_expr , irreps[i][1], j, exprs)
        end
        check_decomposition(irreps[i], exprs)
        push!(expr_map, exprs)    
        
#        exit()
    end
#    println(gram_schmidt(irreps[2][1], irrep1, irrep2, expr_map)) 
    return
end

export calc_CG_coffes
