include("summrize.jl")

function trans_term(coffs, ids, next_expr, exprs)
    println("trans term")
    println(ids)
    println(coffs)
    ids2, coffs2 = [], []
    for i in 1:length(ids)
        if length(exprs[ids[i]])>0
            for term in exprs[ids[i]]
                push!(next_expr, Term(-coffs[i]*term.coff, term.gt1, term.gt2))
            end
        else
            push!(ids2, ids[i])
            push!(coffs2, coffs[i])
        end
    end
    next_expr = summrize(next_expr)
    
    println(length(next_expr))
    println(to_string_ket(next_expr))
    if length(ids2)==1
        for term in next_expr
            term.coff /= coffs2[1]
        end
        exprs[ids2[1]] = next_expr
        return
    end
                      
    error("実装中")
end
