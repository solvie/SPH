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
face_upper_left = face(1:floor(face_x_length/2), 1:floor(face_y_length/2), :);
face_upper_right = face(1:floor(face_x_length/2), floor(face_y_length/2):face_y_length, :);
face_lower_left = face(floor(face_x_length/2):face_x_length, 1:floor(face_y_length/2), :);
face_lower_right = face(floor(face_x_length/2):(face_x_length), floor(face_y_length/2):face_y_length, :);

%Detect eyes
eyedetect = vision.CascadeObjectDetector('LeftEyeCART');
eyes_bound = step(eyedetect, face_upper_right);

imshow(face_upper_rightce);
hold on;
%eyes = output_bounded(face, eyes_bound);
for i = 1:size(eyes_bound,1)
    rectangle('Position',eyes_bound(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
rectangle('Position',eyes_bound,'LineWidth',4,'LineStyle','-','EdgeColor','b');


%imshow(I); hold on
%for i = 1:size(BB,1)
% rectangle('Position',BB(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
%end
