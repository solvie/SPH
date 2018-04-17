function [outimage] = highpass_color(image)
    hp = (1/4).*[0 -1 0;-1 4 -1;0 -1 0];
    outimage = zeros(size(image));
    outimage(:,:,1) = conv2(image(:,:,1), hp,'same');
    outimage(:,:,2) = conv2(image(:,:,2), hp,'same');
    outimage(:,:,3) = conv2(image(:,:,3), hp,'same');
end

