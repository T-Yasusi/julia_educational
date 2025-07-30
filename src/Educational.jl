module Educational

include("Educational/DoubleExponentialIntegration.jl")
include("Educational/SpecialFunctions.jl")
# include("Educational/SpecialFunctions/OrthogonalPolynomials/hermite.jl")
# include("Educational/SpecialFunctions/OrthogonalPolynomials/laguerre.jl")

using .DoubleExponentialIntegration
using .SpecialFunctions

export DoubleExponentialIntegration, SpecialFunctions

# module SpecialFunctions
# module OrthogonalPolynomials
# export legendre, hermite, laguerre
#     # chebyshev1, chebyshev2, associated_legendre, normalized_associated_legendre, associated_laguerre, jacobi_function
# end
# end

end
