%Generate random message
m = rand(1,4) < 0.5;
disp('Random message generated m:');
disp(m);

%Encode Codeword: m -> c
c = linearblockencoder844(m);
disp('Encoded message c:');
disp(c);

%Erase part of message with set probability using erasure channel: c -> y
p_error = 0.2;
y = erasurechannel(p_error,c);
fprintf('Codeword passed through erasure channel with p_error = %d y:\n', p_error);
disp(y);

%Generate codebook for exhaustive decoding
codebook = linearblockcodebook844();

%Decode received message using the codebook
decoded = decodemsglinblock844(codebook, y);


if decoded(1)==-1
    disp('result not found')
else
    disp('Decoded codeword mhat');
    disp(decoded);
end