function [percentage] = detect_redness_level(circle_center,circle_radius, image)
% returns the percentage of the circled part of image that is above the
% redness threshold. 
newimage = image;
x_cent = circle_center(1);
y_cent = circle_center(2);
viscircles(circle_center, circle_radius,'EdgeColor','b');

circlearea = 0;
redarea = 0;
for x = 1: size(image,1)
    for y = 1: size(image,2)
        %+1 to the circle radius just to be generous with the mask
        if (((x-x_cent)^2+ (y-y_cent)^2) <= (circle_radius^2))
            circlearea = circlearea+1;
            %NOTE THAT IMAGE is Y,X not X,Y
            rgb = image(y,x,:);
            rgb = rgb(:);
            if (redness_over_threshold(rgb, 20)==1)
                redarea = redarea+1;
                newimage(y,x,:) = [0,0,0];
            end
        end
    end
end 

%imshow(newimage)

percentage = redarea/circlearea;
end

