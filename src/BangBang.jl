module BangBang

# Use README as the docstring of the module:
@doc read(joinpath(dirname(@__DIR__), "README.md"), String) BangBang

export
    @!,
    append!!,
    delete!!,
    empty!!,
    lmul!!,
    materialize!!,
    mul!!,
    pop!!,
    popfirst!!,
    push!!,
    pushfirst!!,
    rmul!!,
    setindex!!,
    setproperty!!,
    splice!!

using Base.Broadcast: materialize!
using InitialValues
using LinearAlgebra
using Requires

include("NoBang/NoBang.jl")
using .NoBang: ImmutableContainer

include("core.jl")
include("base.jl")
include("linearalgebra.jl")
include("initials.jl")
include("macro.jl")

function __init__()
    @require StaticArrays="90137ffa-7385-5640-81b9-e52037218182" begin
        include("staticarrays.jl")
    end
    @require Zygote="e88e6eb3-aa80-5325-afca-941959d7151f" begin
        include("zygote.jl")
    end
end

end # module
