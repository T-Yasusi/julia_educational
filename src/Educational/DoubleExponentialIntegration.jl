module DoubleExponentialIntegration

using QuadGK
include("Integration/trapezoid.jl")

include("DoubleExponentialIntegration/deint.jl")
include("DoubleExponentialIntegration/minus_inf_to_inf.jl")
include("DoubleExponentialIntegration/zero_to_inf.jl")
include("DoubleExponentialIntegration/minus_one_to_one.jl")

export deint

end
