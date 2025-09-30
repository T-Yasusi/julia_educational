module Integration

using QuadGK

include("Integration/trapezoid.jl")
include("Integration/simpson.jl")
include("Integration/arc_integral.jl")

export arc_integral, trapezoid, simpson

end
