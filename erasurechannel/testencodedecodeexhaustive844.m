function [ retval ] = testencodedecodeexhaustive844( p_error, codebook, print_msgs )
   %Generate random message
   m = rand(1,4) < 0.5;
   %Encode Codeword: m -> c
   c = linearblockencoder844(m);
   %Erase part of message with set probability using erasure channel: c -> y
   y = erasurechannel(p_error,c);
   %Decode received message using the codebook
   decoded = decodemsglinblock844(codebook, y);
   
   if print_msgs
       disp('Random message generated m:');
       disp(m);
       disp('Encoded message c:');
       disp(c);
       fprintf('Codeword passed through erasure channel with p_error = %d y:\n', p_error);
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

