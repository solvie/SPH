function [center, radius, error] = find_best_iris(eye_edges, image)
        %imshow(eye_edges)
        error =0;
        % get a reasonable range of sizes for the given image size
        
        % reasonable lower threshold is the floor of 1/10th of the image;
        lower_rad = floor(min(size(eye_edges,1), size(eye_edges,2))/10);
        
        % reasonable upper threshold is 1/2rd of the image;
        upper_rad = floor(max(size(eye_edges,1), size(eye_edges,2))/2);

        candidate_radii=[];
        candidate_centers=[];

        % For each R, G, and B
        for i= 1:3
            relativecenters=[];
            relradii=[];
            [relativecenters, relradii] = imfindcircles(eye_edges(:,:,i), [lower_rad upper_rad], 'Sensitivity', 0.95);
           % viscircles(relativecenters, relradii,'EdgeColor','b');
            candidate_radii = [candidate_radii; relradii];
            candidate_centers = [candidate_centers; relativecenters];
        end
        % Find the candidates that actually contain red, more than 50%
        % which is over threshold. Pick the one with the highest threshold
        current_highest = 0;
        current_highest_index=0;
        
        for i = 1: length(candidate_radii)
           redness = detect_redness_level(candidate_centers(i,:), candidate_radii(i), image);
           %disp('redness');
           %disp(redness);
           if (redness>=0.5 && redness>current_highest)
               current_highest = redness;
               current_highest_index=i;
           end
        end
        
        if (current_highest>0) % found the red eye
            center = candidate_centers(current_highest_index, :);
            radius = candidate_radii(current_highest_index);
            return;
        else % try again with half-size radii; maybe we got the entire iris instead of just the red pupil
            disp('trying again');
            for i = 1: length(candidate_radii)
               redness = detect_redness_level(candidate_centers(i,:), candidate_radii(i)/2, image);
               disp(redness);
               %disp('redness');
               %disp(redness);
               if (redness>=0.5 && redness>current_highest)
                   current_highest = redness;
                   current_highest_index=i;
               end
            end
            
            if (current_highest>0) % found the red eye
                center = candidate_centers(current_highest_index, :);
                radius = candidate_radii(current_highest_index)/2;
                return;
            else
                center=[];
                radius=0;
                error=1;
            end
        end
end

