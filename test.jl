using QuadGK
using SpecialFunctions   # Jν(x) のために必要

# ν次のベッセル関数 Jν の m番目の零点を返す（近似解→fzeroで refine）
using Roots

println(besselj(1.5+1.0im, 3.0+0.0im))
exit()
        

function bessel_zero(ν, m)
    # Jν の零点はほぼ π*(m + ν/2 - 1/4) あたりに分布
    guess = π * (m + ν/2 - 1/4)
    find_zero(x -> besselj(ν, x), guess)
end

# 直交性積分を計算
function ortho_integral(ν, m, n)
    αm = bessel_zero(ν, m)
    αn = bessel_zero(ν, n)
    f(r) = besselj(ν, αm * r) * besselj(ν, αn * r) * r
    quadgk(f, 0.0, 1.0)[1]
end

# 理論値（m=n の場合のみ非ゼロ）
function ortho_theory(ν, m, n)
    if m == n
        αm = bessel_zero(ν, m)
        return 0.5 * (besselj(ν+1, αm))^2
    else
        return 0.0
    end
end

# 確認
ν = 1.5 + 1.0im   # 例: J0
for m in 1:3, n in 1:3
    I = ortho_integral(ν, m, n)
    T = ortho_theory(ν, m, n)
    println("ν=$ν, m=$m, n=$n: 数値 = $I, 理論 = $T, 誤差 = $(I-T)")
end
