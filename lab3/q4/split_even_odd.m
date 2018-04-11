function [ even_indexed, odd_indexed ] = split_even_odd( vector )
% Even and odd according to 0 index, NOT 1 indexing as matlab does.
    N=length(vector);
    even_indexed = zeros(1, N/2);
    odd_indexed = zeros(1, N/2);
    for i=1:N
        if (mod(i,2)==0) %odd because matlab index starts from 1
            odd_indexed(i/2) = vector(i);
        else
            even_indexed(floor(i/2+1)) = vector(i);
        end
    end
end

