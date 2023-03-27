clear all
fs = 6;
ts = 0:1/fs:1;
xn = 3+cos(2*pi*2*ts) + 2*cos(2*pi*4*ts);
subplot(2,2,1)
plot(ts,xn);
title('Sampled Signal')
subplot(2,2,2)
sincInterpolation(xn,fs,10)
title('Sinc Interpolation')
fs = 100; % sampling rate 100 samples per second
t = 0:1/fs: 1; %100 samples interval is 0.01 second (1/fs)
xsa = 3 + cos(2*pi*2*t)+2*cos(2*pi*2*t);
subplot(2,2,3)
plot(t, xsa);
title('Plot of Xsa(t)')
sgtitle('Task 2 Plots')