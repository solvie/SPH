function [ retval ] = testgaussiandecode( p_error,print_msgs )
   %Generate random message
   m = rand(1,4) < 0.5;
   %Encode Codeword: m -> c
   c = linearblockencoder844(m);
   %Erase part of message with set probability using erasure channel: c -> y
   y = erasurechannel(p_error,c);
   %Decode received message using the codebook
   decoded = gaussiandecode844(y);
   
   if print_msgs
       disp('Random message generated m:');
       disp(m);
       disp('Encoded message c:');
       disp(c);
       fprintf('Codeword passed through erasure channel with p_error = %d y:\n', 0.5);
       disp(y);
       disp('Decoded codeword mhat');
       disp(decoded);
   end
   if m==decoded(1:4)
        retval = true;
   else
        retval = false;
   end
end
