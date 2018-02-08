function [ mhat ] = decode_exhaustive( y, codebook )
    dmin = 100000;%arbitrarily high
    result= 0;
    for a= 1: size(codebook,1)
        cee = codebook(a,7:18);
        dval = (y-cee) * (y-cee)';
        if dval<dmin
           dmin= dval;
           result= a;
        end
    end
    mhat= codebook(result,1:4); 
end

