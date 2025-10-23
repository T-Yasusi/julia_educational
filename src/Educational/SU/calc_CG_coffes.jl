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

    exprs = fill(Vector{Term}(), length(irreps[1]))
    exprs[1] = [ Term(1.0, irrep1[1], irrep2[1]) ]

    for i in 2:length(irreps[1][1])
        next(irreps[1], irrep1, irrep2, [ Term(1.0, irrep1[1], irrep2[1]) ] , irreps[1][1], i, exprs)
    end

    for i in 1:length(irreps[1])
        println("i = ", i, "  ", irreps[1][i])
        println(to_string_ket(irreps[1][i]), " = ", to_string_ket(exprs[i]))
    end
end

export calc_CG_coffes
