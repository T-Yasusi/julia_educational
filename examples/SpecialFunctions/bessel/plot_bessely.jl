using Plots

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions

max_n = 5    # 最大次数
xs = range(0.01, 10; length=400) # 描画区間

colors = palette(:tab10) # 色や凡例用
p = plot(title="Bessel Function \$ Y_0 \\sim Y_$max_n \$", legend=:topright, ylim = (-5, 1) )

for n in 0:max_n
    ys = [bessely(n, xi) for xi in xs]

    plot!(xs, ys, label="\$ Y_$n(x) \$", color=colors[mod1(n+1, length(colors))]) # プロットに追加
end

display(p)
