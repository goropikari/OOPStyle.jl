using OOPStyle, PyCall, Random
using Test

@testset "OOPStyle.jl" begin
    Random.seed!(0)
    v = rand(10)
    @test reshape(v, 2, 5) == v.reshape(2,5)
    @test length(v) == v.length()

    np = pyimport("numpy")
    np.random.seed(0)
    @test sprint(print, np.random.rand(10)) == "[0.548814, 0.715189, 0.602763, 0.544883, 0.423655, 0.645894, 0.437587, 0.891773, 0.963663, 0.383442]"
end
