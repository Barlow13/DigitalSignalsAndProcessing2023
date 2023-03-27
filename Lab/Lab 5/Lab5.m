clear all
fs = 44100;
f = 1000; % or 7000, 10000
T = 1/fs;
t = 0:T:10;
sig = 0.1*sin(2*pi*f*t);
sound(sig, fs)