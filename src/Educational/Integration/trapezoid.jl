function trapezoid(f::Function, a::Real, b::Real, n::Int=1000)
    h = (b - a) / n
    x = range(a, b, length=n+1)
    y = f.(x)
    return h * (sum(y) - 0.5*(y[1] + y[end]))
end
