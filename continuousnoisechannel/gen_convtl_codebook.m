function [ codebook ] = gen_convtl_codebook( )
    %init codebook
    codebook = zeros(2^4,18);
    for b =0 : (2^4-1)
        codebook(b+1,1:4) = mod(de2bi(b,4,'left-msb'),2);
        sr= zeros(1,2);
        i=1;
        x= 1;
        while i<12
            codebook(b+1, i+6)= mod(codebook(b+1,x)+sr(1)+sr(2),2);
            codebook(b+1, i+7)= mod(codebook(b+1,x)+sr(2),2);
            sr(2)= sr(1);
            sr(1)= codebook(b+1, x);
            i = i+2;
            x = x+1;
        end
    end
end

