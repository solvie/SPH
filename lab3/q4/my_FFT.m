function [ fd_vec ] = my_FFT( in_vec )
    % Assumes that the input vector is an exponent of 2
    size = length(in_vec);
    halfway = size/2;
    fd_vec = zeros(1, size);
    if (length(in_vec)==2)% base case
       fd_vec(1) = in_vec(1)+in_vec(2)*w(2,0);
       fd_vec(2) = in_vec(1)-in_vec(2)*w(2,0);
    else% recursive
       [even, odd] = split_even_odd(in_vec);
       even_fft = my_FFT(even);
       odd_fft = my_FFT(odd);
       fd_vec(1:halfway) = even_fft + odd_fft.*w_half_vector(size);
       fd_vec(halfway+1:size) = even_fft - odd_fft.*w_half_vector(size);
    end
end

