m = rand(1,4) < random;
%Bit Error function from channel, with gaussian noise
e = sigma*randn(1,12);
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

%Corrupt part of the codeword using bit error channel
y = c+e;
dmin = 100000;
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