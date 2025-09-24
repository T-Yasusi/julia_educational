include("theta.jl")

function calc_z_tau(u::Complex, m::Complex; tol)
    function AGM(m::Complex, tol = tol)
        a, g = 1.0, sqrt(1.0 - m)
        while abs(a - g) > tol
            a, g = (a + g) /2 ,sqrt(a * g)
        end
        return a;
    end
    m2 = 1-m
    agm  = AGM(m, tol)
    agm2 = AGM(m2, tol)
    
    tau = im * agm / agm2
    z = u*agm/pi

    return (z, tau)
end

function jacobi_sn_theta(u::Complex, m::Complex; atol=1.0e-12, rtol=1.0e-12)
    z, tau = calc_z_tau(u, m, tol=atol)
    num = theta3(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta1(z, tau, atol=atol, rtol=rtol)
    deno = theta2(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta4(z, tau, atol=atol, rtol=rtol)
    return num/deno
end

function jacobi_cn_theta(u::Complex, m::Complex; atol=1.0e-12, rtol=1.0e-12)
    z, tau = calc_z_tau(u, m, tol=atol)
    num = theta4(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta2(z, tau, atol=atol, rtol=rtol)
    deno = theta2(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta4(z, tau, atol=atol, rtol=rtol)
    return num/deno    
end

function jacobi_dn_theta(u::Complex, m::Complex; atol=1.0e-12, rtol=1.0e-12)
    z, tau = calc_z_tau(u, m, tol=atol)
    num = theta4(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta3(z, tau, atol=atol, rtol=rtol)
    deno = theta3(0.0 + 0.0im, tau, atol=atol, rtol=rtol)*theta4(z, tau, atol=atol, rtol=rtol)
    return num/deno
end

export jacobi_sn_theta, jacobi_cn_theta, jacobi_dn_theta
