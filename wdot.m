function result = wdot(a, b)
%WDOT Dot product of two vectors.
%   result = wdot(a, b) returns the dot product of vectors a and b.
    result = sum(a .* b);
end
