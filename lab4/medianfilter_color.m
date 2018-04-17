function [Kmedian] = medianfilter_color(image)
    Kmedian(:,:,1) = medfilt2(image(:,:,1));
    Kmedian(:,:,2) = medfilt2(image(:,:,2));
    Kmedian(:,:,3) = medfilt2(image(:,:,3));
end

