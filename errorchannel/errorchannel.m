function [y] = errorchannel(p_error,codeword)
    %Bit Error function from channel
    e = rand(1,8) < p_error;
    %Corrupt part of the codeword using bit error channel
    y = mod (codeword+e,2);
end

