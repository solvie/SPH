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
    mhat = syndromedecodemsg844(H, r, syndrome_table, syndrome_error);
    
    %find number of different bits between mhat and m 
    diffSyn = sum(abs(mhat-m));
end

