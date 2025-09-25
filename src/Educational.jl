module Educational

include("Educational/DoubleExponentialIntegration.jl")
include("Educational/SpecialFunctions.jl")

using .DoubleExponentialIntegration
using .SpecialFunctions

export DoubleExponentialIntegration, SpecialFunctions

end
