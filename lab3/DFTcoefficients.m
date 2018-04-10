function [ out ] = DFTcoefficients( signal )
    N = length(signal);
    n = 0:1:N-1; 
    k = 0:1:N-1; 
    out = ((exp(-1j*2*pi/N) .^ (n'*k))*signal' );
end
