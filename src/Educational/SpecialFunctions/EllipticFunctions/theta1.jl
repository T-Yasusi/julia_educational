function theta1(z::Complex, tau::Complex; atol=1e-8, rtol=1e-8, Nmax = 1000)
    @assert imag(tau)>0 "theta function(z, tau) imag(tau) should be positive $tau"
    
    factor = 1
    q = exp(im*pi*tau)
#    println("input: z = ", z, "  tau = ", tau, "  q = ", q)

    # モジュラー変換
    if abs(q)>0.9
#        println("モジュラー変換 適応")
        factor = 1/sqrt(-im*tau) * exp(-pi*im*z^2/tau)
        z = z/tau
        tau = -1/tau
        q = exp(im*pi*tau)
#        println("z = ", z, "  tau = ", tau, "  q = ", q)
    end
    
    m = -floor(Int, imag(z)/imag(tau))
#    println("m = ", m)
    factor *= (-1)^m*exp(pi*im*m^2*tau+2*pi*im*m*z)
    z += m*tau
#    println("2. z = ", z, "  tau = ", tau, "  q = ", q)
#    println("n = ", floor(Int, real(z)))
    factor *= (-1)^(floor(Int, real(z)))
    z -= floor(Int, real(z))
#    println("3. z = ", z, "  tau = ", tau, "  q = ", q)    
    
    s = 2*q^(1/4)*sin(pi*z)
#    println("term0 = ", s)
    n = 1
    while n <= Nmax
        a = 2*(-1)^n*q^((n+1/2)^2)
        term = a*sin((2*n+1)*pi*z)
        s_new = s + term
 #       println(2*(-1)^n, "  ", q^((n+1/2)^2), "  ", sin((2*n+1)*pi*z))
 #       println("term = ", term)
 #       println("n = ", n, "  atol = ", abs(term), "  rtol = ", abs(term)/abs(s_new))
        if abs(a) < atol || abs(a)/abs(s_new) < rtol
 #           println("factor = ", factor, "  val = ", s_new)
            return factor*s_new
        end

        if isnan(s_new)
            break
        end
        s = s_new
        n += 1
    end

    error("theta1 did not converge within $Nmax terms")
end

export theta1
