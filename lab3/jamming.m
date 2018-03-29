x = audioread('speech.wav');
Fs = 16000;     
Fc = 400; % seconds per sample
t = (0: 1/Fs:(length(x)-1)/Fs)';     % seconds
jam = 0.290* sin(2*pi*Fc*t);
z = rms(jam)^2;
plot(t,x+jam);
sound(x+jam, 16000);
%awgn(in,snr) DONT FORGET THIS ADDS NOISE

