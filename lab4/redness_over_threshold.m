function [isoverthreshold] = redness_over_threshold(rgb, THRESHOLD)
    r = rgb(1);
    g = rgb(2);
    b = rgb(3);
    isoverthreshold=0;
    if (r-(b+g)/2 > THRESHOLD)
        isoverthreshold =1;
    end
end

