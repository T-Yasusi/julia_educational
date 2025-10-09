include("generate_GT_pattern.jl")
include("weight_from_GT.jl")
include("eign_from_GT.jl")
include("irrep_dimN.jl")

function calc_CG_coffes(w1::Vector{Int}, w2::Vector{Int})
    irrep1, sym1 = generate_GT_pattern(w1)
    irrep2, sym2 = generate_GT_pattern(w2)
    
    if length(irrep1) < length(irrep2)
        irrep1, irrep2 = irrep2, irrep1
        sym1, sym2 = sym2, sym1
    end

    top_weights = Vector{Vector{Int}}()
    for gt in irrep2
        b = deepcopy(gt)
        for i in 1:length(gt)-1
            for j in 1:length(gt[i])-1
                b[i][j] -= gt[i+1][j]
            end
        end
#        println("   perttern = ", gt)
#        println("   b = ", b)

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
    println(top_weights)

    irreps, syms = Vector[], Vector[]
    for w in top_weights
        ip, s = generate_GT_pattern(w)
        push!(irreps, ip)
        push!(syms, s)
    end

    tot_dim = 0
    for irrep in irreps
        tot_dim += length(irrep)
    end

    println("Calc CG coffecients")
    println("> dim N1 = ", length(irrep1))
    println("> dim N2 = ", length(irrep2))

    println("> total dim = ", tot_dim)
end

export calc_CG_coffes
