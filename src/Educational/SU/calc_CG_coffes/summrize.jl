function summrize(expr)
    dict = Dict{Tuple{Vector{Vector{Int}},Vector{Vector{Int}}}, Float64}()
    for t in expr
        key = (t.gt1, t.gt2)
        dict[key] = get!(dict, key, 0.0) + t.coff
    end
    result = [Term(v, k[1], k[2]) for (k, v) in dict]
    return [ t for t in result if abs(t.coff) > 1e-8 ]
end
