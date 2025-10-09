include("../../src/Educational.jl")

using .Educational.SU

pattern, E = generate_GT_pattern([2, 2, 2, 1, 0])

println(E[1])
