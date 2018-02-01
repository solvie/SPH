stepsize=0.02;
lastp = 0.6;
random = 0.5;
sigma= 0.4;

numRows = int8((lastp)/stepsize);
ResultMatrix = zeros(numRows , 2); %initialize empty

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

for j = 0: numRows % for each p
    p = double(j)*stepsize;
    errorSum = 0;
    numTrials = 50000;
    
    for k = 1:numTrials % take average over 10 values, arbitrarily for now
        %Generate random message
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
        for a= 1: length(codebook)
            cee = codebook(7:18);
            dval = (y-cee)' * (y-cee);
            if dval<dmin
               dmin= dval;
               result= a;
            end
        end
        mhat= codebook(result,1:4);  
    end
end 