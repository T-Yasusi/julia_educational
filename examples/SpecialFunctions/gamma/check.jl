using Printf

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions
import SpecialFunctions

println(gamma(0.5), "  ", SpecialFunctions.gamma(0.5), " ", sqrt(pi))
