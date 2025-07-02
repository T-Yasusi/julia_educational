function gamma(z::Symbolics.Num)
    @variables t
    ∫(t^(z-1) * exp(-t), t -> (0, Inf)) 
end

function gamma(x::Union{Real, Complex})
    if x isa Real
        if x == floor(x)
            if x<=0 
                return Inf
            else
                return factorial(x-1)
            end
        end
    end

    real = x isa Read ? x : x.re
    n0 = floor(abs(real))

    if 1<=real 
        x0 = x - n0
        val = deint(t-> x^(x0-1) * exp(-t), 0, Inf)
        for i in 1:n0
            val *=x0
            x0 += 1
        end
        return val
    else
        x0 = x + n0 +2
        val = deint(t-> x^(x0-1) * exp(-t), 0, Inf)
        for i in 0:n0+2
            x0 = x0 + 1
            val = val/x0
        end
        return val;
    end
end
