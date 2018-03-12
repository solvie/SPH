function [ a ] = generate_tone( freq )   
    amp=0.01 ;
    duration=2;
    fs=freq*10;  % sampling frequency
    values=0:1/fs:duration;
    a=amp*sin(2*pi*freq*values);
    sound(a,fs);
end

