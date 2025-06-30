using Printf

include("../../src/Educational.jl")
using .Educational.DoubleExponentialIntegration

function check(f, expected, a=-1.0, b=1.0)
    val, _ = deint(f, a, b);
    @printf "∫[0:1] 1/√x dx = %.6f  (expected %.6f)\n" val expected
end

# check( x -> 1/sqrt(1-x^2), pi )
# check( x -> log((1+x)/(1-x)), 0 )
# check( x -> sqrt(1-x^2), pi/2 )
# check( x -> sqrt(1-x), 4*sqrt(2)/3 )
# check( x -> sqrt(1+x), 4*sqrt(2)/3 )
# check( x -> log(1-x^2), -12) 

@printf "∫[ 0:1] 1/√x dx = %.6f  (expected %.6f)\n"             deint(x -> 1/sqrt(x), 0, 1)[1]           2
@printf "∫[-1:1] 1/√(1-x^2) dx = %.6f  (expected %.6f)\n"       deint(x -> 1/sqrt(1-x^2), -1, 1)[1]      pi
@printf "∫[-1:1] log((1+x)/(1-x)) dx = %.6f  (expected %.6f)\n" deint(x -> log((1+x)/(1-x)), -1, 1)[1]   0
@printf "∫[-1:1] sqrt(1-x^2) dx = %.6f  (expected %.6f)\n"      deint(x -> sqrt(1-x^2), -1, 1)[1]        pi/2
@printf "∫[-1:1] 1/√(1-x) dx = %.6f  (expected %.6f)\n"         deint(x -> 1/sqrt(1-x), -1, 1)[1]        2*sqrt(2)

# println(deint(x -> 1/sqrt(x), 0, 1), 2)
# println(deint(x -> 1/(1-x^2), -1, 1), 2)
