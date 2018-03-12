function [ y ] = gaussian_noise_channel( sigma, codeword )
    %Erasure function from channel
    e = sigma*(randn(1,8));
    %Erase part of the codeword using erasure channel
    y = codeword+e;
end
