f0=1800; % the frequency of the tone
fs = 4200; % sampling rate
ts = 0:1/fs:2; % samples for 2 second with sampling interval = 1/fs
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)