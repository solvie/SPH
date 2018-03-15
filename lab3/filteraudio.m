function [ out ] = filteraudio( audio, Fs, freq )
    shiftedabsx = fftshift(fft(audio));
    lowpassedsax = lowpass(freq, shiftedabsx, Fs);
    shiftedback = fftshift(lowpassedsax);
    out= arrayfun(@realsignabs, ifft(shiftedback));
    plot(out);
end

