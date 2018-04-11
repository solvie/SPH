function [ out_vec ] = w_half_vector( N )
% Assumes that N is an exponent of 2.
% Gives a w vector for half the k values.
% For example, N=8, so W_8 will give (w_8^0, w_8^1, w_8^2, w_8^3)
    out_vec = zeros(1, N/2);
    for i=1:N/2
       out_vec(i) = w(N, i-1); 
    end
end

