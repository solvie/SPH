function [returned_signal] = undojamming(audio, Fs)
% This assumes that in the corrupted signal, at the frequency of the jamming sinusoid we have the highest amplitude in the frequency domain. (If a signal is jammed enough to be unintelligible, the highest amplitude in the freq. domain SHOULD be the jamming domain).

%fd_signal is the signal in the frequency domain
%Fs is the sampling frequency of the original signal
    if (mod(length(audio),2) ~=0) % making it even numbered to ensure symmetry later
        audio = [audio;0];
    end 
    
    % convert to frequency domain
    fd_signal = fftshift(fft(audio));
    
    % initialize return value as the original signal
    n= length(fd_signal);
    returned_signal = fd_signal;
    
    % find the index of the max. value, which will be where the jamming is
    [max_val, index_of_max] = max(abs(fd_signal));
    
    % Set the range centered around this index to 0, removing the values there; and do the same for the other side because it's symmetric.
    returned_signal(index_of_max-100:index_of_max+100) = 0;
    returned_signal(n-index_of_max-100:n-index_of_max+100) = 0;
    
	% convert the signal back into the time domain
	returned_signal = real(ifft(fftshift(returned_signal)));
    
    plot(returned_signal);
end

