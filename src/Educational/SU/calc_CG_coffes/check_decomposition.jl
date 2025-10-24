include("../to_string_ket.jl")

function check_decomposition(irreps, exprs; print_level = 1)
    if print_level > 0
        println("===== Decomposition check ", irreps[1][1], " ==================================")
    end
    for expr in exprs
        val = sum( [ term.coff*term.coff for term in expr ] )
        @assert abs(val)>1e-8 "$(irreps[1]) decomposition fault"
        @assert length(expr) > 0 "$(irreps[1]) empty expr"
    end
    if print_level > 0
        for i in 1:length(irreps)
            println("  > ", to_string_ket(irreps[i]), " = ", to_string_ket(exprs[i]))
        end
    end
end
