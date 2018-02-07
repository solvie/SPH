function [ decodedmsg  ] = decodemsglinblock844( codebook, y )
    decodedmsg = [-1,-1,-1,-1];
    for i = 0:(2^4-1)
       %Finds the first possible match
       if max(abs(y-codebook(i+1,:))) ~= 1
          decodedmsg =codebook(i+1,1:4);
          break
       end
    end
end

