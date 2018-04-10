function [ out ] = realsignabs( x )
    if (real(x)<0)
        out = -abs(x);
    else
        out = abs(x);
    end
end

