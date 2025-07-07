using Plots

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions

xs = -4.9:0.01:5.0
ys = [isfinite(gamma(x)) ? gamma(x) : NaN for x in xs]  # 無限大のところはNaN

p = plot(xs, ys, lw=2, label="Γ(x)", xlabel="x", ylabel="Γ(x)", title="Gamma function with poles", legend=:topright)

display(p)
