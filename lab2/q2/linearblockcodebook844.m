function [ codebook ] = linearblockcodebook844()
    %Generator Matrix G = [1 0 0 0 1 1 1 0;0 1 0 0 1 1 0 1; 0 0 1 0 1 0 1 1; 0 0 0 1 0 1 1 1];
    G= [eye(4),rot90(~eye(4))];
    length = 2^4;
    codebook = zeros(length,4*2);
    for i = 0:(length-1)
       codebook(i+1,:) = mod(de2bi(i,4,'left-msb')*G,2);
    end
end