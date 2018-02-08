function [diffEx,diffSyn] = testencodedecodeboth( p_error, H, syndrome_error, syndrome_table,codebook, print_msgs )
    %Generate random message
    m = rand(1,4) < 0.5;

    %Codeword created from message and Generator 
    c = linearblockencoder844(m);

    %Corrupt part of the codeword using bit error channel
    r = errorchannel(p_error, c);
    
    %Decode exhaustively
    mhat = decodemsglinblockexhaustive844(codebook,r);

    %find number of different bits between mhat and m 
    diffEx = sum(abs(mhat-m));
    
    %Decode with syndrome
    index = 10;
    Hrt =mod( H*r',2);
    for i = 1: length(syndrome_table)
       if max(abs(Hrt'-syndrome_table(i,:)))==0 
          index = i;
          break
       end
    end
    if index==10 % if not found, max error
        diffSyn=4;
    else 
        ehat = syndrome_error(index,:);
        chat = mod(ehat+r,2);
        mhat = chat(1:4);
        diffSyn = sum(abs(mhat-m));
    end
end

