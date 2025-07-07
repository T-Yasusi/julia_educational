using Printf

include("../../src/Educational.jl")
using .Educational.SpecialFunctions

real_parts = range(0.5, step=1.0, length=5)
imag_parts = range(0.5, step=1.0, length=5)
println("=== Check 1: w(z) + w(-z) ≈ 2exp(-z^2) ===")
for z in [Complex(re, im) for re in real_parts, im in imag_parts]
    lhs = faddeeva(z) + faddeeva(-z)
    rhs = 2 * exp(-z^2)
    @printf("z = %6.2f %+6.2fi | w(z) + w(-z) = %10.5f %+10.5fi | 2exp(-z^2) = %10.5f %+10.5fi\n",
        real(z), imag(z), real(lhs), imag(lhs), real(rhs), imag(rhs))
end

println("\n=== Check 2: w(-z) ≈ conj(w(conj(z))) ===")
for z in [Complex(re, im) for re in real_parts, im in imag_parts]
    lhs = faddeeva(-z)
    rhs = conj(faddeeva(conj(z)))
    @printf("z = %6.2f %+6.2fi | w(-z) = %10.5f %+10.5fi | conj(w(conj(z))) = %10.5f %+10.5fi\n",
        real(z), imag(z), real(lhs), imag(lhs), real(rhs), imag(rhs))
end

