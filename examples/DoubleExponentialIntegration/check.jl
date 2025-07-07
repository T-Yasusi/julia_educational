using Printf

include("../../src/Educational.jl")
using .Educational.DoubleExponentialIntegration

@printf "∫[-1:1] 1/√(1-x^2) dx = %.6f  (expected %.6f)\n"       deint(x -> 1/sqrt(1-x^2), -1, 1)[1]      pi
@printf "∫[-1:1] log((1+x)/(1-x)) dx = %.6f  (expected %.6f)\n" deint(x -> log((1+x)/(1-x)), -1, 1)[1]   0
@printf "∫[-1:1] sqrt(1-x^2) dx = %.6f  (expected %.6f)\n"      deint(x -> sqrt(1-x^2), -1, 1)[1]        pi/2
@printf "∫[-1:1] 1/√(1-x) dx = %.6f  (expected %.6f)\n"         deint(x -> 1/sqrt(1-x), -1, 1)[1]        2*sqrt(2)

@printf "∫[ 0:1] 1/√x dx = %.6f  (expected %.6f)\n"             deint(x -> 1/sqrt(x), 0, 1)[1]           2

# println(deint(x -> 1/sqrt(x), 0, 1), 2)
# println(deint(x -> 1/(1-x^2), -1, 1), 2)
