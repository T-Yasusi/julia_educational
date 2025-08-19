import SpecialFunctions: besselj as J, bessely as Y
using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions

function dump(ν, x)
    @printf "J_%f(%f) = %f  %f \n" ν x besselj(ν, x) J(ν, x)
end


dump(0.99, 1.0)
dump(1, 1.0)
dump(1.01, 1.0)

