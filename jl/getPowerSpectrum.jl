# Get the power spectrum of the signal
# Arguments:  signal, Array{T, 1}, the signal
#             sampling_freq, Float64, the frequency at which the signal was sampled
# Returns:  freq_array = Array{Float64, 1}, array of the frequencies covered
#           power = Array{Float64, 1}, the power at those frequencies

function getPowerSpectrum(signal::Array{Float64,1}, sampling_freq::Float64)
  sig_length, fourier_tr = length(signal), fft(signal)
  required_points = ceil(Int, (sig_length+1)/2) # don't need the second half
  power = (abs.(fourier_tr[1:required_points])/sig_length).^2
  if sig_length%2 > 0
    power[2:end] = power[2:end]*2
  else
    power[2:end-1] = power[2:end-1]*2
  end
  freq_array = (0:required_points-1)*(sampling_freq/sig_length)
  return freq_array, power
end
