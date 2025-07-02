using Symbolics
using QuadGK
using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.OrthogonalPolynomials

@variables x
max_l = 5

# 数値関数への変換関数
function symbolic_to_function(p)
    fn_expr = Symbolics.build_function(p, x)
    return eval(fn_expr)
end

function expected(m::Int, l::Int, l2::Int)
    if l != l2
        return 0
    end

    val = 2/(2*l+1)
    for i in 1:l+m
        val *= i
    end
    for i in 1:l-m
        val /= i
    end
    return val
end

for l in 0:max_l
    for l2 in 0:max_l
        max_m = l>l2 ? l2 : l
        for m in -max_m:max_m
            f1 = symbolic_to_function( associated_legendre(m, l, x) )
            f2 = symbolic_to_function( associated_legendre(m, l2, x) )
#            f1 = x -> associated_legendre(m, l, x) 
#            f2 = x -> associated_legendre(m, l2, x) 
            val, _ = quadgk( x-> f1(x) * f2(x), -1, 1)
            @printf "⟨P(%d, %d), P(%d, %d)⟩ = %.6f (expected %.6f)\n" m l m l2 val expected(m, l, l2)
        end
    end
end
            
