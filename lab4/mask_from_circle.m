function [mask] = mask_from_circle(circle_center, circle_radius, image)
x_cent = circle_center(1);
y_cent = circle_center(2);

mask = ones(size(image,1), size(image,2));

for x = 1: size(image,1)
    for y = 1: size(image,2)
        %+1 to the circle radius just to be generous with the mask
        if (((x-x_cent)^2+ (y-y_cent)^2) <= ((circle_radius+1)^2))
            mask(y,x) = 0; %just because of the circle output convention this is what makes it work weirdly
        end
    end
end    
end

