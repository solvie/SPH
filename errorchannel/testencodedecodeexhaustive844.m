function [ num_diffs_mhat_m ] = testencodedecodeexhaustive844( p_error, codebook, print_msgs )
    %Generate random message
    m = rand(1,4) < 0.5;

    %Codeword created from message and Generator 
    c = linearblockencoder844(m);

    %Corrupt part of the codeword using bit error channel
    y = errorchannel(p_error, c);

    %Decode exhaustively
    mhat = decodemsglinblockexhaustive844(codebook,y);

    %find number of different bits between mhat and m 
    num_diffs_mhat_m = sum(abs(mhat-m));

    if print_msgs
        disp('Random message generated m:');
        disp(m);
        disp('Encoded message c:');
        disp(c);
        fprintf('Codeword passed through erasure channel with p_error = %d y:\n', p_error);
        disp(y);
        disp('Decoded codeword mhat');
        disp(mhat);
    end
end

