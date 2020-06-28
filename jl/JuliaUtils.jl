module JuliaUtils

using FFTW

export countUnique,
  getPowerSpectrum,
  ma,
  rms,
  smoothen,
  sphereVolume

include("countUnique.jl")
include("getPowerSpectrum.jl")
include("ma.jl")
include("rms.jl")
include("smoothen.jl")
include("sphereVolume.jl")

end
