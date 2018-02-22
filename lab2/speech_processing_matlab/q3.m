%NOTE: do NOT run this as a script, just copy paste the relevant parts

% sound sample
x = audioread('speech.wav');
% impulse response
h = audioread('h.wav');

% sound sample convolved with impulse response
y = conv(x,h);

% sound sample convolved with echoey impulse response
hprime = [zeros(1,3000), h']+[h',zeros(1,3000)];
yprime = conv(x,hprime);  

% playbacks
sound(x,16000); %normal
sound(x,13000); %slow
sound(x,20000); %sped
sound(fliplr(x'), 16000)%backwards

% sub-sampled 2:1
x2 = downsample(x,2);
x2f = reshape([zeros(size(x2'));x2'],1,[]);
fftx2n = fft(x2f);
fftx2n = fftshift(fftx2n);
plot(abs(fftx2n));
title('Frequency Spectrum of Signal Subsampled 2:1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% sub-sampled 3:1
x3 = downsample(x,3);
x3f = reshape([zeros(2, length(x3));x3'],1,[]);
fftx3n = fft(x3f);
fftx3n = fftshift(fftx3n);
plot(abs(fftx3n));
title('Frequency Spectrum of Signal Subsampled 3:1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% sub-sampled 4:1
x4 = downsample(x,4);
x4f = reshape([zeros(3, length(x4));x4'],1,[]);
fftx4n = fft(x4f);
fftx4n = fftshift(fftx4n);
plot(abs(fftx4n));
title('Frequency Spectrum of Signal Subsampled 4:1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% sub-sampled 5:1
x5 = downsample(x,5);
x5f = reshape([zeros(4, length(x5));x5'],1,[]);
fftx5n = fft(x5f);
fftx5n = fftshift(fftx5n);
plot(abs(fftx5n));
title('Frequency Spectrum of Signal Subsampled 5:1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% sub-sampled 5:1
x10 = downsample(x,10);
x10f = reshape([zeros(9, length(x10));x10'],1,[]);
fftx10n = fft(x10f);
fftx10n = fftshift(fftx10n);
plot(abs(fftx10n));
title('Frequency Spectrum of Signal Subsampled 10:1');
xlabel('Frequency (Hz)');
ylabel('Magnitude');


