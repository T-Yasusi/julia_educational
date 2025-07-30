using Documenter, Educational

makedocs(
    sitename = "教育用Juliaライブラリ解説ページ",
    modules = [ Educational ],
    format = Documenter.HTML(
        mathengine = Documenter.MathJax()
    ),
    remotes = nothing,
    pages =[
        "Home" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/T-Yasusi/julia_educational.git",
    branch = "gh-pages",
    devbranch = "main"
)
