function deint(f::Function, a::Real, b::Real; atol::Real=1e-8, rtol::Real=1e-8)    
    if a == -Inf && b == Inf
        return minus_inf_to_inf(f; atol=atol, rtol=rtol)
    elseif a == 0 && b == Inf
        return zero_to_inf(f; atol=atol, rtol=rtol)
    elseif isfinite(a) && b == Inf
        return zero_to_inf(x -> f(x-a); atol=atol, rtol=rtol)
    elseif a == -Inf && isfinite(b)
        return zero_to_inf(x -> -f(b-x); atol=atol, rtol=rtol)
    elseif a == -1 && b == 1
        return minus_one_to_one(f; atol=atol, rtol=rtol)
    elseif isfinite(a) && isfinite(b)
        val, err = minus_one_to_one(x -> f((b-a)*x/2 + (a+b)/2); atol=atol, rtol=rtol)
        return (b-a)*val/2, (b-a)*err/2;
    else
        error("DE積分がサポートしていない区間です: [$a, $b]には対応していません。") 
    end
end
