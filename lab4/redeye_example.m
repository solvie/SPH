
%Import image
pic = imread('redeyebefore.jpg');

%Detect faces
facedetect = vision.CascadeObjectDetector;
face_bound = step(facedetect, pic);

face = output_bounded(pic, face_bound);

eyedetect = vision.CascadeObjectDetector('LeftEyeCART');
eyes_bound = step(eyedetect, face);

for i = 1:size(eyes_bound,1)
    rectangle('Position',eyes_bound(i,:),'LineWidth',4,'LineStyle','-','EdgeColor','r');
end
