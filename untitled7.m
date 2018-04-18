
%Import image
%pic = imread('brownred.jpg');

%Detect faces
%facedetect = vision.CascadeObjectDetector;
%face_bound = step(facedetect, pic);

%face = output_bounded(pic, face_bound);

face = imread('longer.png');

eyedetect = vision.CascadeObjectDetector('RightEyeCART');
eyes_bound = step(eyedetect, face);

eyes_bound = eyes_bound(2:3,:);

face_c= correct_red_eyes(face,eyes_bound );
imshowpair(face, face_c, 'montage');