include("generate_GT_pattern.jl")
include("weight_from_GT.jl")
include("eign_from_GT.jl")
include("irrep_dimN.jl")
include("decompose_irrep.jl")

function calc_CG_coffes(w1::Vector{Int}, w2::Vector{Int})
    irrep1 = generate_GT_pattern(w1)
    irrep2 = generate_GT_pattern(w2)
    top_weights = decompse_irrep(irrep1, irrep2)

    @variables E1[1:length(irrep1)]
    @variables E2[1:length(irrep2)]
    
    irreps, syms = Vector[], Vector[]
    for w in top_weights
        irrep = generate_GT_pattern(w)
        push!(irreps, irrep)
        name = Symbol("E_sub$(length(irreps))")
        push!(syms, [ Symbolics.variable(Symbol("$(name)[$i]")) for i in 1:length(irrep) ] )
    end
    
    total_dim = 0
    for irrep in irreps
        total_dim += length(irrep)
    end

    println("Calc CG coffecients")
    println("> dim N1 = ", length(irrep1))
    println("> dim N2 = ", length(irrep2))
    println(E1)
    
    println("> total dim = ", total_dim)
    
    expr = E1[1] * E2[1]
    println(expr)
end

export calc_CG_coffes
