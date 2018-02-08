function [ numDiffs ] = testencodedecodesyndrome844( p_error, H, syndrome_error, syndrome_table, print_msgs )
    
    %Generate random message
    m = rand(1,4) < 0.5;

    %Codeword created from message and Generator 
    c = linearblockencoder844(m);

    %Corrupt part of the codeword using bit error channel
    r = errorchannel(p_error, c);
    index = 10;
    Hrt =mod( H*r',2);
    for i = 1: length(syndrome_table)
       if max(abs(Hrt'-syndrome_table(i,:)))==0 
          index = i;
          break
       end
    end
    if index==10 % if not found, max error
        %numDiffs=4;
        ehat = syndrome_error(1,:);
        chat = mod(ehat+r,2);
        mhat = chat(1:4);
        numDiffs = sum(abs(mhat-m));
    else 
        ehat = syndrome_error(index,:);
        chat = mod(ehat+r,2);
        mhat = chat(1:4);
        numDiffs = sum(abs(mhat-m));
    end
end

