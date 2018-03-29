function [ out ] = filteraudio( audio, Fs, freq )
    if (mod(length(audio),2) ~=0) % making it even numbered to ensure symmetry later
        audio = [audio;0];
    end 
    shiftedabsx = fftshift(fft(audio));
    lowpassedsax = lowpass(freq, shiftedabsx, Fs);
    shiftedback = fftshift(lowpassedsax);
    out= arrayfun(@realsignabs, ifft(shiftedback));
    plot(out);
end

