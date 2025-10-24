include("calc_CG_coffes/Term.jl")

function to_string_ket(gt::Vector{Vector{Int}})
    str = "| ";
    for i in 2:length(gt)-1
        val = 2*sum(gt[i])-(sum(gt[i-1])+sum(gt[i+1]))
        if val % 2 == 0
            str *= "$(val/2), "
        else
            str *= "$(round(Int, val))/2, "
        end
    end
    val = 2*sum(gt[length(gt)])-(sum(gt[length(gt)-1]))
    if val % 2 == 0
        str *= "$(val/2) >"
    else
        str *= "$(round(Int, val))/2 >"
    end
    
    return str
end

function to_string_ket(expr::Vector{Term})
    function inner(term::Term)
        return "$(abs(term.coff)) " * to_string_ket(term.gt1) * to_string_ket(term.gt2) 
    end
    
    if length(expr) == 0
        return ""
    else
        str = ( expr[1].coff > 0 ? "" : " - " ) * inner(expr[1])
        for i in 2:length(expr)
            str *= ( expr[i].coff > 0 ? " + " : " - " ) * inner(expr[i])
        end
        return str
    end
end
