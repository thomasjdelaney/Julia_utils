# root mean squared function.
# Arguments:  A = Array{Float, 1}
# Returns:    Array{Float, 1} the root mean squared 

function rms(A)
   s = 0.0
   for a in A
      s += a*a
   end
   return sqrt(s / length(A))
end
