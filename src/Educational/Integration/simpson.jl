function simpson(f::Function, a::Union{Real, Complex}, b::Union{Real, Complex}, n::Int = 1000)
    @assert n % 2 == 0 "n must be even"
    h = (b - a) / n
    x = a:h:b
    y = f.(x)
    
    s = y[1] + y[end] +
        4 * sum(y[2:2:end-1]) +
        2 * sum(y[3:2:end-2])
    return h/3 * s
end
