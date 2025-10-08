module Educational

include("Educational/DoubleExponentialIntegration.jl")
include("Educational/SpecialFunctions.jl")
include("Educational/Integration.jl")

using .DoubleExponentialIntegration
using .SpecialFunctions
using .Integration

include("Educational/SU.jl")

using .SU

export DoubleExponentialIntegration, SpecialFunctions, Integration, SU



end
