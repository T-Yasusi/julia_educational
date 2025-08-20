using Documenter, Educational

makedocs(
    sitename = "教育用Juliaライブラリ解説ページ",
    modules = [ Educational ],
    format = Documenter.HTML(
        mathengine = Documenter.MathJax()
    ),
    remotes = nothing,
    pages =[
        "Home" => "index.md",
        "特殊関数" => [
            "直行系" => [
                "ルジャンドル関数"       => "SpecialFunctions/legendre.md",
                "ルジャンドル陪関数"     => "SpecialFunctions/associated_legendre.md",
                "ラゲール関数"           => "SpecialFunctions/laguerre.md",
                "ラゲール陪関数"         => "SpecialFunctions/associated_laguerre.md",
                "エルミート関数"         => "SpecialFunctions/hermite.md",
                "第一種シェビシェフ関数" => "SpecialFunctions/chebyshev1.md",
                "第二種シェビシェフ関数" => "SpecialFunctions/chebyshev2.md",
                "ヤコビ多項式"           => "SpecialFunctions/jacobi.md"
            ]
            "ベータ・ガンマ関数" => "SpecialFunctions/beta_gamma.md"
        ]
    ]
)

deploydocs(
    repo = "github.com/T-Yasusi/julia_educational.git",
    branch = "gh-pages",
    devbranch = "main",
    push_preview = true
)
