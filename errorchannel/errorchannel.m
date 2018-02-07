function [y] = errorchannel(p_error,codeword)
%ERRORCHANNEL Summary of this function goes here
    %Bit Error function from channel, p hardcoded to 0.2
    e = rand(1,8) < p_error;
    %Corrupt part of the codeword using bit error channel
    y = mod (codeword+e,2);
end

