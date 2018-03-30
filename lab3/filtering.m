noise = 0.163*randn(length(x),1);
x = audioread('speech.wav');
y =filteraudio(x+noise, 16000,500);
sound(y, 16000);


