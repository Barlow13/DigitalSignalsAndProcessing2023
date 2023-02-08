clear all
fs = 100;           % sampling rate 100 samples per second
t = 0:1/fs: 1;      %100 samples interval is 0.01 second (1/fs)
x = 3 + cos(2*pi*2*t) + 2*cos(2*pi*4*t);
plot(t, x);

fs= 8;              % Nyquist rate
ts=0:1/fs:1;
xn= 3 + cos(2*pi*2*ts)+2*cos(2*pi*4*ts);
figure(1)
stem(ts,xn);
figure(2)
plot(ts,xn);
figure(3)
[xHat, fsH] = sincInterpolation(xn,fs,10);