function [ retval ] = testencodedecode844( p_error, codebook, print_msgs )
    %Generate random message
    retval = false;
    m = rand(1,4) < 0.5;
   % disp('Random message generated m:');
    %disp(m);
    
    %Encode Codeword: m -> c
    c = linearblockencoder844(m);
  %  disp('Encoded message c:');
   % disp(c);
    
   %Erase part of message with set probability using erasure channel: c -> y
    y = erasurechannel(p_error,c);
   % fprintf('Codeword passed through erasure channel with p_error = %d y:\n', p_error);
   % disp(y);
    
   %Decode received message using the codebook
    decoded = decodemsglinblock844(codebook, y);
   % disp('Decoded codeword mhat');
   % disp(decoded);
    
   if m==decoded
        %disp('Message successfully decoded');
        retval = true;
    else
        %disp('Message not recovered');
        retval = false;
    end
end

