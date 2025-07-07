function gamma(z::Symbolics.Num)
    @variables t
    return ∫(t^(z-1) * exp(-t), t -> (0, Inf)) 
end

function gamma(x::Union{Real, Complex})
    if x isa Real
        if x == floor(x)
            if x<=0
                return Inf
            else
                return factorial(Int(x-1))
            end
        end
    end

    n0 = floor(abs(real(x)))
    
    if 1<=real(x)
        x0 = x - n0 + 1
        val, _ = deint(t-> t^(x0-1) * exp(-t), 0, Inf)
        for i in 1:n0-1
            val *= x0
            x0 += 1
        end
        return val
    else
        x0 = x + n0 +2
        val, _ = deint(t-> t^(x0-1) * exp(-t), 0, Inf)
        for i in 0:n0+1
            x0 = x0 - 1
            val /= x0
        end
        return val;
    end
end
