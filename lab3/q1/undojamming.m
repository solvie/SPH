function [returned_signal] = undojamming(audio, Fs)
%This assumes that the fft of jammed signal has its highest amplitude in the freq.
%domain at the frequency of the jamming.

%fd_signal is the signal in the frequency domain
%Fs is the sampling frequency of the original signal
    if (mod(length(audio),2) ~=0) % making it even numbered to ensure symmetry later
        audio = [audio;0];
    end 
    
    %convert to frequency domain
    fd_signal = fftshift(fft(audio));
    n= length(fd_signal);

    returned_signal = fd_signal;
    f = (Fs*(-n/2:(n/2))/n)';
    f = f(1:length(fd_signal));
    
    [max_val, index_of_max] = max(abs(fd_signal));
    
    %Set this area to 0 
    returned_signal(index_of_max-15:index_of_max+15) = 0;
    returned_signal(n-index_of_max-15:n-index_of_max+15) = 0;

    %set the opposite side to 0 as well
    
    %returned_signal(starti+1:endi)=fd_signal(starti+1:endi);
    returned_signal = real(ifft(fftshift(returned_signal)));
    
    plot(f,returned_signal);
end

