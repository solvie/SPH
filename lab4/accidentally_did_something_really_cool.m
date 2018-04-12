%Import image
pic = imread('redeyebefore.jpg');

%Detect faces
facedetect = vision.CascadeObjectDetector;
face_bound = step(facedetect, pic);

%Bounding_boxes has all of the rectangles containing the faces.
face = output_bounded(pic, face_bound);


%divide the face into four portions
face_x_length = length(face(:,1,1));
face_y_length = length(face(1,:,1));
face_upper_left = face(1:(face_x_length/2), :);

imshow(face_upper_left);