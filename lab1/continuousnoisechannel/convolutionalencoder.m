function [ c ] = convolutionalencoder( m )
    sr= zeros(1,2);
    padded_msg_len= length(sr)+length(m);
    c= zeros(1,padded_msg_len*2);
    m = [m ,sr];
    %encoder
    i= 1;
    while i< length(c)
        c(i)= mod(m(int8(i/2))+sr(1)+sr(2),2);
        c(i+1)= mod(m(int8(i/2))+sr(2),2);
        sr(2)= sr(1);
        sr(1)= m(int8(i/2));
        i = i+2;
    end
end

