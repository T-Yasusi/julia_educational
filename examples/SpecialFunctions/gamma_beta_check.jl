include("../../src/Educational.jl")
using .Educational.SpecialFunctions

x = 5.0 + 3.0im
y = 3.0 + 2.0im

println("Γ(", x, ")Γ(", y, ")/Γ(", x + y, ") = ", gamma(x)*gamma(y)/gamma(x+y))
println("B(", x, ", ", y, ") = ", beta(x, y))

