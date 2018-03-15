function [ returned_signal ] = lowpass( cutoff_frequency, fd_signal, Fs )
%fd_signal is the signal in the frequency domain
%Fs is the sampling frequency of the original signal
    n= length(fd_signal);
    f = (Fs*(-n/2:(n/2))/n)';
    f = f(1:length(fd_signal));

    returned_signal = zeros(length(fd_signal), 1);
    vec1 = find(-cutoff_frequency>f);
    starti=vec1(end);
    vec2 = find(cutoff_frequency<f);
    endi = vec2(1);
    returned_signal(starti:endi)=fd_signal(starti:endi);
    
    plot(f,returned_signal);
end

