function [face_corrected] = correct_red_eyes(face, eyesbound)
    num_eyes = size(eyesbound,1);
    face_corrected = face;
    %for each eye, remove red if detected.
    for i = 1: num_eyes
        eye = output_bounded(face, eyesbound(i,:));
        % put through median filter
        filtered_eye = medianfilter_color(eye);
        
        % put through quantizer
        quantized_eye = quantize(filtered_eye,4);
        
        % put through hp filter
        eye_edges = highpass_color(quantized_eye);
        
        %imshow(eye_edges);
        
        % find circles to detect iris 
        [relativecenter, radius, error] = find_best_iris(eye_edges, eye);
        
        if (error==0)
            % put the center back relative to the larger image.
            center = zeros(2);
            center(1) = relativecenter(1)+eyesbound(i,1);
            center(2) = relativecenter(2)+eyesbound(i,2);

            % Assuming one circle was detected, make a mask from it
            [facemask, blue, green] = mask_from_circle(center, radius, face);

            % Desaturate that area using the mask.
            face_corrected(:,:,1) = cast(face_corrected(:,:,1), 'double').*facemask;
            face_corrected(:,:,2) = cast(face_corrected(:,:,2), 'double').*blue;
            face_corrected(:,:,2) = cast(face_corrected(:,:,2), 'double').*green;

        end
   end
    

end

