module Educational

include("Educational/DoubleExponentialIntegration.jl")
include("Educational/SpecialFunctions.jl")
include("Educational/Integration.jl")

using .DoubleExponentialIntegration
using .SpecialFunctions
using .Integration

export DoubleExponentialIntegration, SpecialFunctions, Integration

end
