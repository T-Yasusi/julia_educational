include("theta2.jl")
function theta1(z::Complex, tau::Complex; atol=1e-8, rtol=1e-8, Nmax = 1000)
    return -theta2(z+1/2, tau, atol=atol, rtol=rtol, Nmax=Nmax)
end

include("theta3.jl")
function theta4(z::Complex, tau::Complex; atol=1e-8, rtol=1e-8, Nmax = 1000)
    return theta3(z+1/2, tau, atol=atol, rtol=rtol, Nmax=Nmax)
end

export theta1, theta2, theta3, theta4
