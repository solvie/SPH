function [outimage] = output_bounded(image, bounding_box)
    upper_left_x = bounding_box(2);
    upper_left_y = bounding_box(1);
    width = bounding_box(3);
    length = bounding_box(4);
    outimage = image(upper_left_x:upper_left_x+width, upper_left_y:upper_left_y+length,:);
end

