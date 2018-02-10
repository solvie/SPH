function [ numDiffs ] = testencodedecodesyndrome844( p_error, H, syndrome_error, syndrome_table, print_msgs )
    %Generate random message
    m = rand(1,4) < 0.5;

    %Codeword created from message and Generator 
    c = linearblockencoder844(m);

    %Corrupt part of the codeword using bit error channel
    r = errorchannel(p_error, c);
    
    %Decode
    mhat = syndromedecodemsg844(H, r, syndrome_table, syndrome_error);
    
    %return the number of diffs
    numDiffs = sum(abs(mhat-m));
    if print_msgs
        disp('Random message generated m:');
        disp(m);
        disp('Encoded message c:');
        disp(c);
        fprintf('Codeword passed through erasure channel with p_error = %d y:\n', p_error);
        disp(r);
        disp('Decoded codeword mhat');
        disp(mhat);
    end
end

