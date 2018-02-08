function [ numDiffs ] = testencodedecodeexhaustive( sigma, codebook, print_msgs )
    %Generate random message
    m = rand(1,4) < 0.5;
    %Bit Error function from channel, with gaussian noise
    e = sigma*randn(1,12);
    %encode the message
    c = convolutionalencoder(m);
    %Corrupt part of the codeword using bit error channel
    y = c+e;
    %decode using the exhaustive decoder
    mhat = decode_exhaustive(y, codebook);
    numDiffs = sum(abs(mhat-m));
    if print_msgs
        disp('Random message generated m:');
        disp(m);
        disp('Encoded message c:');
        disp(c);
        fprintf('Codeword passed through noisy channel with sigma = %d y:\n', sigma);
        disp(y);
        disp('Decoded codeword mhat');
        disp(mhat);
    end
end

