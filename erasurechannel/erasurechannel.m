function [ y ] = erasurechannel( p_error, codeword )
    %Erasure function from channel
    e = 0.5*(rand(1,8) < p_error);
    %Erase part of the codeword using erasure channel
    y = abs(codeword-e);
end

