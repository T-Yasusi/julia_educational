module SU

using Symbolics

include("SU/generate_GT_pattern.jl")
include("SU/irrep_dimN.jl")

export generate_GT_pattern, irrep_dimN

end
