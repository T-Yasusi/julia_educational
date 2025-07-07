function beta(x::Symbolics.Num, y::Symbolics.Num)
    @variables t
    return ∫(t^(x-1) * (1-t)^(y-1), t -> (0, 1))
end

function beta(x::Union{Real, Complex}, y::Union{Real, Complex})
    @assert real(x) > 0 "beta: real(x) must be positive"
    @assert real(y) > 0 "beta: real(y) must be positive"
#    return deint( t-> exp((x-1) * log(t)) * exp((y-1) * log(1-t)), 0, 1)[1]
    return quadgk( t-> exp((x-1) * log(t)) * exp((y-1) * log(1-t)), 0, 1)[1]
end
