const SIZE_MAX = 1024
using Libdl

arch = lowercase(String(Sys.ARCH))
kernel = lowercase(String(Sys.KERNEL))

if kernel == "darwin"
	ext = "dylib"
end

const libWGPU = "$(@__DIR__)/../gen/libwgpu.$ext" |> normpath

const DEFAULT_ARRAY_SIZE = 1024
