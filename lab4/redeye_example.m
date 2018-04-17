%Import image
pic = imread('redeyebefore.jpg');

%Detect faces
facedetect = vision.CascadeObjectDetector;
face_bound = step(facedetect, pic);

%Bounding_boxes has all of the rectangles containing the faces.
face = output_bounded(pic, face_bound);

newface = correct_red_eyes(face);

imshowpair(face, newface, 'montage');