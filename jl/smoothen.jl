# based on function found here: http://www.simulkade.com/posts/2015-05-07-how-to-smoothen-noisy-data.html
# Requires: DSP
# for smoothening noisy arrays, uses conv
# Arguments:  noisy = Array{float}, array to be smoothened
#             win_length = Int, the length of the window to be used
#             win_method = the method for creating the filter window
# Returns:    smooth = Arary{Float}, A smoothened version of the noisy array

function smoothen(noisy::Array{Float64}; win_length::Int=11, win_method::Int=2)
  if win_length%2 == 0
    win_length += 1 # only use odd numbers
  end
  if win_method == 1
    window = ones(win_length)
  elseif win_method == 2
    window = DSP.hanning(win_length)
  elseif win_method == 3
    window = DSP.hamming(win_length)
  end
  if win_length < 3
    return noisy
  elseif length(noisy) < win_length
    return noisy
  else
    noisy_ext = [2*noisy[1]-flipdim(noisy[1:win_length], 1); noisy[:]; 2*noisy[end]-flipdim(noisy[end-win_length:end], 1)]
    smooth = conv(noisy_ext, window/sum(window))
    ind = floor(Int, 1.5*win_length)
    return smooth[1+ind:end-ind-1]
  end
end
