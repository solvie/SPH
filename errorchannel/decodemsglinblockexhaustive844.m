function [ decodedmsg  ] = decodemsglinblockexhaustive844( codebook, y )
    v = 9; % Set initial hamming distance to arbitrary max greater than 8
    decodedmsg = [-1,-1,-1,-1];
    for i = 1:(2^4)
      if v > sum(abs(y-codebook(i,:))) %found a codeword with a lower hamming distance
          v = sum(abs(y-codebook(i,:)));
          decodedmsg = codebook(i,1:4);
      end
    end
end

