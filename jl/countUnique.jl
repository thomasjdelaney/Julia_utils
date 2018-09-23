"""
For counting the number of occurances of each unique element in an array

Arguments:  x, the array

returns:    unique_x, occurances
"""
function countUnique(x::Array)
  unique_x = unique(x);
  num_uniques = length(unique_x);
  occurances = zeros(Int, num_uniques);
  sort!(unique_x);
  for i in 1:num_uniques
    element = unique_x[i];
    occurances[i] = count(element .== x);
  end
  sum(occurances) != length(x) && error(string(now(), " Number of occurances not equal to length of input"))
  return unique_x, occurances
end


