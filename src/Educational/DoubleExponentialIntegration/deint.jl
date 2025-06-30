function deint(f::Function, a::Real, b::Real; atol::Real=1e-8, rtol::Real=1e-8)
    if a == -Inf && b == Inf
        return minus_inf_to_inf(f; atol=atol, rtol=rtol)
    elseif a == 0 && b == Inf
        return zero_to_inf(f; atol=atol, rtol=rtol)        
    else
        error("DE積分がサポートしていない区間です: [$a, $b]には対応していません。") 
    end
end
