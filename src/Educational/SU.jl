module SU

using Symbolics

include("SU/generate_GT_pattern.jl")
include("SU/irrep_dimN.jl")
include("SU/calc_CG_coffes.jl")

export generate_GT_pattern, irrep_dimN, calc_CG_coffes

end
