include("../lower_op.jl")
include("Term.jl")
include("trans_term.jl")
include("summrize.jl")

function next(irrep, irrep1, irrep2, expr, gt, i, exprs)
#    println("===== Calc Lower Operator : i = ", i, " =====")
#    println( to_string_ket(gt), " = ", to_string_ket(expr) )
    
    next_expr = Vector{Term}()
    for term in expr
        as, idxs = lower_op(term.gt1, i, irrep1)
        for k in 1:length(as)
            push!(next_expr, Term(as[k]*term.coff, irrep1[idxs[k]], term.gt2))
        end
    end
    for term in expr
        as, idxs = lower_op(term.gt2, i, irrep2)
        for k in 1:length(as)
            push!(next_expr, Term(as[k]*term.coff, term.gt1, irrep2[idxs[k]]))
        end
    end

    next_expr = summrize(next_expr)
    
    as, idxs = lower_op(gt, i, irrep)

    if length(as)==0
        return
    elseif length(as)==1
        for term in next_expr
            term.coff /= as[1]
        end
        exprs[idxs[1]] = next_expr
        
        for j in 2:length(gt)
            next(irrep, irrep1, irrep2, next_expr, irrep[idxs[1]], j, exprs)
        end
    else
        idxs, next_expr = trans_term(as, idxs, next_expr, exprs)
        if length(idxs) == 1
            for j in 2:length(gt)
                next(irrep, irrep1, irrep2, next_expr, irrep[idxs[1]], j, exprs)
            end
        end        
    end
end
