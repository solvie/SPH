function [ vector_o ] = butterfly_n( n, vector )
% make sure n is the same size as the vector input
    vector_o = zeros(1,n);
    vector_o(1:n/2) = vector(1:n/2) + w_half_vector(n).*vector(n/2+1:n);
    vector_o(n/2+1:n) = vector(1:n/2) - w_half_vector(n).*vector(n/2+1:n);
end

