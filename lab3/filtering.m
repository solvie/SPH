x = audioread('speech.wav');
shiftedabsx = abs(fftshift(fft(x)));

n= length(x);
Fs = 16000;
f = (Fs*(-n/2:(n/2))/n)';
f = f(1:length(x));

plot(f, shiftedabsx);

lowpassed4k = zeros(length(shiftedabsx), 1);


