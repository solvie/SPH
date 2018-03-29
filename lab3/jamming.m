x = audioread('speech.wav',16000);
Fs = 16000;     
Fc = 400; % seconds per sample
t = (0: 1/Fs:(length(x)-1)/Fs)';     % seconds
jam = (1/4)*cos(2*pi*Fc*t);

plot(t,x+jam)
