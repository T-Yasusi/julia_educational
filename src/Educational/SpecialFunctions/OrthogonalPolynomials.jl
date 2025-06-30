module OrthogonalPolynomials

using Symbolics

include("OrthogonalPolynomials/legendre.jl")
include("OrthogonalPolynomials/hermite.jl")
include("OrthogonalPolynomials/laguerre.jl")
include("OrthogonalPolynomials/chebyshev1.jl")
include("OrthogonalPolynomials/chebyshev2.jl")

export legendre, hermite, laguerre, chebyshev1, chebyshev2

end
