using Symbolics

x1 = @variables x
x2 = @variables x

expr = x1[1]*x2[1]
println(expr)
