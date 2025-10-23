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
    if length(expr) == 0
        return ""
    elseif length(expr) == 1
        return "$(expr[1].coff) " * to_string_ket(expr[1].gt1) * to_string_ket(expr[1].gt2)
    else
        str = ""
        for i in 1:length(expr)-1
            str *= "$(expr[i].coff) " * to_string_ket(expr[i].gt1) * to_string_ket(expr[i].gt2) * " + "
        end
        str *= "$(expr[length(expr)].coff) " * to_string_ket(expr[length(expr)].gt1) * to_string_ket(expr[length(expr)].gt2)
        return str
    end
end
