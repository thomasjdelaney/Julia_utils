"""
For calculating a simple moving average over an array

Arguments:  x, array
            window, size of the window

Returns:    array, same length as x

source: https://stackoverflow.com/questions/34406691/how-to-add-a-column-of-simple-moving-average-of-another-column-to-a-julia-data-f
"""
function ma(x, window::Int)
  length_x = length(x)
  moving_average = zeros(Float64, length_x)
  for i in 1:length_x
    low_index = max(1, i-window)
    high_index = min(length_x, i+window)
    moving_average[i] = mean(x[low_index:high_index])
  end
  return moving_average
end
