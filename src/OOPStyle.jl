module OOPStyle

using Requires

# ref: The article posted by yatra9.
# https://qiita.com/yatra9/items/0a1a9a5ba19e9efe08c0#%E6%BC%94%E7%AE%97%E5%AD%90%E3%81%AE%E3%82%AA%E3%83%BC%E3%83%90%E3%83%BC%E3%83%AD%E3%83%BC%E3%83%89%E3%81%8Cjulia%E7%95%8C%E3%81%B8%E4%B8%8E%E3%81%88%E3%82%8B%E5%BD%B1%E9%9F%BF
Base.getproperty(obj, s::Symbol) = isdefined(obj, s) ? getfield(obj, s) : eval(quote (args...) ->  $(s)($obj, args...) end)

# Base.getproperty(obj::PyObject, s::Symbol) = isdefined(obj, s) ? getfield(obj, s) : (obj)[s]
function __init__()
    @require PyCall = "438e738f-606a-5dbb-bf0a-cddfbfd45ab0" begin
        using PyCall
        Base.getproperty(obj::PyCall.PyObject, s::Symbol) = isdefined(obj, s) ? getfield(obj, s) : (obj)[s]
    end
    @require PyPlot = "d330b81b-6aea-500a-939a-2ce795aea3ee" isdefined(Main, :PyCall) || begin
        using PyPlot
        Base.getproperty(obj::PyPlot.PyObject, s::Symbol) = isdefined(obj, s) ? getfield(obj, s) : (obj)[s]
    end
end


end # module
