module EllipticFunctions

include("EllipticFunctions/jacobi_AGM.jl")
# export jacobi_AGM, jacobi_am_AGM, jacobi_sn_AGM, jacobi_cn_AGM, jacobi_dn_AGM

include("EllipticFunctions/theta.jl")
export theta1, theta2, theta3, theta4

include("EllipticFunctions/jacobi_theta.jl")

end
