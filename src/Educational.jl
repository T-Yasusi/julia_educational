module Educational

using Symbolics
include("Educational/DoubleExponentialIntegration/deint.jl")

module DoubleExponentialIntegration
export deint
end

include("Educational/SpecialFunctions/OrthogonalPolynomials/legendre.jl")
include("Educational/SpecialFunctions/OrthogonalPolynomials/hermite.jl")
include("Educational/SpecialFunctions/OrthogonalPolynomials/laguerre.jl")

module SpecialFunctions
module OrthogonalPolynomials
export legendre, hermite, laguerre
    # chebyshev1, chebyshev2, associated_legendre, normalized_associated_legendre, associated_laguerre, jacobi_function
end
end

end
