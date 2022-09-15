module WGPU_jll

export SIZE_MAX
const SIZE_MAX=256

using Revise
using Reexport

include("LibWGPU.jl")
@reexport using .LibWGPU

end
