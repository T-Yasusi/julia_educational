using Plots
import Elliptic.Jacobi

include("../../../src/Educational.jl")
using .Educational.SpecialFunctions.EllipticFunctions

k = 0.1
xs = range(0, 2*pi; length=400) # 描画区間

#println( Jacobi.sn(pi/2, 0.5), " ", jacobi_sn_AGM(pi/2, 0.5) )
#exit()

sns = [ jacobi_sn_AGM(xi, k) for xi in xs ]
cns = [ jacobi_cn_AGM(xi, k) for xi in xs ]
dns = [ jacobi_dn_AGM(xi, k) for xi in xs ]
sns2 = [ Jacobi.sn(xi, k) for xi in xs ]
cns2 = [ Jacobi.cn(xi, k) for xi in xs ]
dns2 = [ Jacobi.dn(xi, k) for xi in xs ]


colors = palette(:tab10) # 色や凡例用
p = plot(title="Jacobi Elliptic Functions", legend=:topright)

plot!(xs, sns,  label="sn(x)")
plot!(xs, sns2, label="sn(x) package")
plot!(xs, cns,  label="cn(x)")
plot!(xs, cns2, label="cn(x) package")
plot!(xs, dns,  label="dn(x)")
plot!(xs, dns2, label="dn(x) package")

display(p)
