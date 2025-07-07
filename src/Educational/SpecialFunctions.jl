module SpecialFunctions
using QuadGK
using Symbolics

include("SpecialFunctions/OrthogonalPolynomials.jl")

include("DoubleExponentialIntegration.jl")
using .DoubleExponentialIntegration

include("SpecialFunctions/gamma.jl")
include("SpecialFunctions/beta.jl")
include("SpecialFunctions/faddeeva.jl")
# include("SpecialFunctions/erf.jl")
export gamma, beta, faddeeva

end
