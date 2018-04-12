function [] = detect_eyes(image)
    eyedetect = vision.CascadeObjectDetector('LeftEyeCART');
    eyes_bound = step(eyedetect, image);
    imshow(image);
    hold on;
    %eyes = output_bounded(face, eyes_bound);
    for i = 1:size(eyes_bound,1)
        rectangle('Position',eyes_bound(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
    end
    rectangle('Position',eyes_bound,'LineWidth',4,'LineStyle','-','EdgeColor','b');
    
end

