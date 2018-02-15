function [mhat] = syndromedecodemsg844(H, r, syndrome_table, syndrome_error)
    index = 10;
    Hrt =mod( H*r',2);
    for i = 1: length(syndrome_table)
       if max(abs(Hrt'-syndrome_table(i,:)))==0 
          index = i;
          break
       end
    end
    if index==10 % if not found, choose random entry from error table which is not the 0 error
        index = randi([2 length(syndrome_table)]);
    end 
    ehat = syndrome_error(index,:);
    chat = mod(ehat+r,2);
    mhat = chat(1:4);
end

