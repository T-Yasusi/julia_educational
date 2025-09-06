using Test

# SpecialFunctions/beta_gamma.jl
include("SpecialFunctions/beta_gamma.jl")

# SpecialFunctions/orthogonal_check/*.jl
include("SpecialFunctions/orthogonal_check/associated_laguerre.jl")
include("SpecialFunctions/orthogonal_check/chebyshev2.jl")
include("SpecialFunctions/orthogonal_check/chebyshev1.jl")
include("SpecialFunctions/orthogonal_check/hermite.jl")
include("SpecialFunctions/orthogonal_check/jacobi_function.jl")
include("SpecialFunctions/orthogonal_check/laguerre.jl")
include("SpecialFunctions/orthogonal_check/legendre.jl")
include("SpecialFunctions/orthogonal_check/normalized_associated_legendre.jl")

include("SpecialFunctions/ellips/jacobi_AGM.jl")
