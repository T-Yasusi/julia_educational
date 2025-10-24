function check_irrep_decomposition(irreps, irrep1, irrep2; print_level = 1)
    total_dim = 0

    str = ""
    for irrep in irreps
        total_dim += length(irrep)
        str *= "$(irrep[1][1]) ⊕ "
    end
    str = str[1:end-4]
    
    @assert total_dim == length(irrep1) * length(irrep2) "Irrep decomposition not match deimension"

    if print_level > 0 
        println("Irrep Decomposition ")
        println(irrep1[1][1], " ⊗ ", irrep2[1][1], " = ", str)
        println("   dim(", irrep1[1][1], ") : ", length(irrep1))
        println("   dim(", irrep2[1][1], ") : ", length(irrep2))
        for irrep in irreps
            println("   > dim(", irrep[1][1], ") : ", length(irrep))
        end
    end    
end
