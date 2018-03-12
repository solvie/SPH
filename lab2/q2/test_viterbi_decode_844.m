function [ retval ] = test_viterbi_decode_844( sigma, print_msgs )
   %Generate random message
   m = rand(1,4) < 0.5;
   %Encode Codeword: m -> c
   c = linearblockencoder844(m);
   %Erase part of message with set probability using erasure channel: c -> y
   y = gaussian_noise_channel(sigma,c);
   %Decode received message using the codebook
   decoded = viterbi_decode_844(y);
   
   if print_msgs
       disp('Random message generated m:');
       disp(m);
       disp('Encoded message c:');
       disp(c);
       fprintf('Codeword passed through erasure channel with sigma = %d y:\n', sigma);
       disp(y);
       disp('Decoded codeword mhat');
       disp(decoded);
   end
   if m==decoded
        retval = true;
   else
        retval = false;
   end
end

