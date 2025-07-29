using Documenter

makedocs(
    sitename = "教育用Juliaライブラリ解説ページ",
    format = Documenter.HTML(
        mathengine = Documenter.MathJax()
    ),
    remotes = nothing,
    pages =[
        "Home" => "index.md"
    ]
)
