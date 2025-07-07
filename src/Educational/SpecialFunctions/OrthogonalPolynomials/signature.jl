"""
        legendre(n::Int, x::Real) -> Real
        legendre(n::Int, x::Complex) -> Complex
        legendre(n::Int) -> Symbolics.Num
        legendre(n::Int, x::Symbolics.Num) -> Symbolics.Num
legendre多項式 P_n(x)を返す。
"""
function legendre end

"""
        hermite(n::Int, x::Real) -> Real
        hermite(n::Int, x::Complex) -> Complex
        hermite(n::Int) -> Symbolics.Num
        hermite(n::Int, x::Symbolics.Num) -> Symbolics.Num
hermite多項式 H_n(x)を返す。
"""
function hermite end

"""
        laguerre(n::Int, x::Real) -> Real
        laguerre(n::Int, x::Complex) -> Complex
        laguerre(n::Int) -> Symbolics.Num
        laguerre(n::Int, x::Symbolics.Num) -> Symbolics.Num
laguerre多項式 L_n(x)を返す。
"""
function laguerre end

"""
        chebyshev1(n::Int, x::Real) -> Real
        chebyshev1(n::Int, x::Complex) -> Complex
        chebyshev1(n::Int) -> Symbolics.Num
        chebyshev1(n::Int, x::Symbolics.Num) -> Symbolics.Num
chebyshev1多項式 T_n(x)を返す。
"""
function chebyshev1 end

"""
        chebyshev2(n::Int, x::Real) -> Real
        chebyshev2(n::Int, x::Complex) -> Complex
        chebyshev2(n::Int) -> Symbolics.Num
        chebyshev2(n::Int, x::Symbolics.Num) -> Symbolics.Num
chebyshev2多項式 U_n(x)を返す。
"""
function chebyshev1 end

"""
        associated_legendre(m::Int, l::Int, x::Real) -> Real
        associated_legendre(m::Int, l::Int, x::Complex) -> Complex
        associated_legendre(m::Int, l::Int) -> Symbolics.Num
        associated_legendre(m::Int, l::Int, x::Symbolics.Num) -> Symbolics.Num
associated_legendre多項式 P^m_l(x)を返す。
"""
function associated_legendre end

"""
        associated_laguerre(m::Int, l::Int, x::Real) -> Real
        associated_laguerre(m::Int, l::Int, x::Complex) -> Complex
        associated_laguerre(m::Int, l::Int) -> Symbolics.Num
        associated_laguerre(m::Int, l::Int, x::Symbolics.Num) -> Symbolics.Num
associated_laguerre多項式 L^n_k(x)を返す。
"""
function associated_laguerre end

"""
        jacobi_function(n::Int, α::Real, β::Real, x::Real) -> Real
        jacobi_function(n::Int, α::Real, β::Real, x::Complex) -> Complex
        jacobi_function(n::Int, α::Real, β::Real) -> Symbolics.Num
        jacobi_function(n::Int, α::Real, β::Real, x::Symbolics.Num) -> Symbolics.Num
jacobi多項式 J_n^α^β(x)を返す。
"""
function jacobi_function end
