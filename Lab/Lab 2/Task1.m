clear all
fs = 100;           % sampling rate 100 samples per second
t = 0:1/fs: 1;      %100 samples interval is 0.01 second (1/fs)
x = 3 + cos(2*pi*2*t) + 2*cos(2*pi*4*t);
subplot(2,2,1)
plot(t, x);
title('Original Signal')
fs= 8;              % Nyquist rate
ts=0:1/fs:1;
xn= 3 + cos(2*pi*2*ts)+2*cos(2*pi*4*ts);
subplot(2,2,2)
stem(ts,xn);
title('Spectrum Of Sampled Signal')
subplot(2,2,3)
plot(ts,xn);
title('Sampled Signal')
subplot(2,2,4)
[xHat, fsH] = sincInterpolation(xn,fs,10);
title('Sinc Interpolation')
sgtitle('Task 1 Plots')