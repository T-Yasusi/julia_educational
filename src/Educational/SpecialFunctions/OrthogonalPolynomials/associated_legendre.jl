function parity_factor(l::Int, m::Int)
    m_abs = abs(m)
    if m < 0
        return (-1)^m_abs * factorial(l - m_abs) / factorial(l + m_abs)
    else
        return 1
    end
end

function associated_legendre(m::Int, l::Int)
    @assert l ≥ 0 "l must be non-negative"
    @assert isinteger(m) && isinteger(l) "m, l must be integers"
    @variables x
    return associated_legendre(m, l, x)
end

function associated_legendre(m::Int, l::Int, x::Union{Real, Complex})
    @assert l ≥ 0 "l must be non-negative"
    @assert isinteger(m) && isinteger(l) "m, l must be integers"

    m2 = abs(m)
    if m2 > l
        return zero(x)
    elseif m2 == l && l == 0
        return one(x)
    end

    # 初期化：a = (2m - 1)!!
    a = 1.0
    for i in 1:2:(2 * m2 - 1)
        a *= i
    end

    a2 = 0.0
    a1 = a * (1 - x^2)^(m2 / 2)

    if m2 == l
        return parity_factor(l, m) * a1
    end

    a0 = (2m2 + 1) * x * a1

    for i in (m2 + 1):(l - 1)
        a2, a1 = a1, a0
        a0 = ((2i + 1) * x * a1 - (i + m2) * a2) / (i - m2 + 1)
    end

    return parity_factor(l, m) * a0
end

function associated_legendre(m::Int, l::Int, x::Symbolics.Num)
    m_abs = abs(m)
    if m_abs > l
        return 0
    elseif m_abs == l && l == 0
        return 1
    end

    # P_m^m(x) 初期項
    a = 1.0
    for i in 1:2:(2*m_abs - 1)
        a *= i
    end
    
    # 再帰用初期値
    P_prev = 0
    P_curr = a * (1 - x^2)^(m_abs/2)
    if m_abs == l
        return parity_factor(l, m) * P_curr
    end

    P_next = (2m_abs + 1) * x * P_curr
    
    # 再帰: P_l^m(x)
    for i in (m_abs + 1):(l - 1)
        P_prev, P_curr = P_curr, P_next
        P_next = ((2i + 1)*x*P_curr - (i + m_abs)*P_prev) / (i - m_abs + 1)
    end

    return parity_factor(l, m) * P_next
end

function normalized_associated_legendre(m::Int, l::Int, x)
    P_lm = associated_legendre(m, l, x)
    norm = sqrt((2l + 1)/2 * factorial(l - m) / factorial(l + m))
    return norm * P_lm
end
