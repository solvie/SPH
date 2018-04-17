function [face_corrected] = correct_red_eyes(face)
    %Detect eyes
    eyedetect = vision.CascadeObjectDetector('LeftEyeCART');
    eyes_bound = step(eyedetect, face);
    
    num_eyes = size(eyes_bound,1);
    if(num_eyes>2)
        disp("More than two eyes were detected in the face, abort");
        return;
    end
    
    face_corrected = face;
    
    %for each eye, remove red if detected.
    for i = 1: num_eyes
        eye = output_bounded(face, eyes_bound(i,:));
        % put through median filter
        filtered_eye = medianfilter_color(eye);
        
        % put through quantizer
        quantized_eye = quantize(filtered_eye,4);
        
        % put through hp filter
        eye_edges = highpass_color(quantized_eye);
        
        % find circles to detect iris
        % the 2 and 200 is what seems to work for the baby...
        [relativecenters, radii, metric] = imfindcircles(eye_edges(:,:,2), [2 200]);
        % viscircles(centers, radii,'EdgeColor','b');
        
        % put the center back relative to the larger image.
        centers = zeros(2);
        centers(1) = relativecenters(1)+eyes_bound(i,1);
        centers(2) = relativecenters(2)+eyes_bound(i,2);

        % Assuming one circle was detected, make a mask from it
        facemask = mask_from_circle(centers, radii, face);
        
        % Desaturate that area using the mask.
        face_corrected(:,:,1) = cast(face_corrected(:,:,1), 'double').*facemask;
   end
    

end

