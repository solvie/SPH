function [ returned_signal ] = lowpass( cutoff_frequency, fd_signal, Fs )
%fd_signal is the signal in the frequency domain
%Fs is the sampling frequency of the original signal
    n= length(fd_signal);
    f = (Fs*(-n/2:(n/2))/n)';
    f = f(1:length(fd_signal)); % TODO find out the source of the two clicks

    returned_signal = zeros(length(fd_signal), 1);
    vec2 = find(cutoff_frequency<f);
    endi = vec2(1);
    starti = length(fd_signal)-endi;
    returned_signal(starti+1:endi)=fd_signal(starti+1:endi);
    
    plot(f,returned_signal);
end

