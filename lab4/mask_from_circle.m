function [mask, mask2, mask3] = mask_from_circle(circle_center, circle_radius, image)
x_cent = circle_center(1);
y_cent = circle_center(2);

mask = ones(size(image,1), size(image,2));
mask2 = ones(size(image,1), size(image,2));
mask3 = ones(size(image,1), size(image,2));


for y = 1: size(image,1)
    for x = 1: size(image,2)
        %+1 to the circle radius just to be generous with the mask
        if (((x-x_cent)^2+ (y-y_cent)^2) <= ((circle_radius+2)^2))
            rgb = image(y,x,:);
            rgb = rgb(:);
            if (sum(rgb)>600) %this is white
                mask(y,x) = 255; %just because of the circle output convention this is what makes it work weirdly
                mask2(y,x) = 255;
                mask3(y,x) = 255;
            elseif (redness_over_threshold(rgb, 20)==1) 
                mask(y,x) = 0; %just because of the circle output convention this is what makes it work weirdly
            else
                mask(y,x) = 0.5; 
            end
            % BEHAVE DIFFERENTLY BASED ON REDNESS.
            
        end
    end
end    
end

