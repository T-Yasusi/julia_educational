module SpecialFunctions
using QuadGK
using Symbolics

include("SpecialFunctions/OrthogonalPolynomials.jl")

include("DoubleExponentialIntegration.jl")
using .DoubleExponentialIntegration

include("SpecialFunctions/gamma.jl")
include("SpecialFunctions/beta.jl")
# include("SpecialFunctions/erf.jl")
export gamma, beta

include("SpecialFunctions/bessel.jl")
export bessel, hankel

include("SpecialFunctions/EllipticFunctions.jl")

end
