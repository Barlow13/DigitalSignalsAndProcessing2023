function [xHat fsH] = sincInterpolation(xn, fs, Rate)
nx = length(xn); % number of samples in the original siganl
Ts = 1/fs; % Origninal sampling interval
lx = Ts*(nx-1); % length of original signal in seconds
ts = 0:1/fs:lx; % Discrete time intervals of the original sampling
fsH = Rate*fs; % A new higher sampling rate
T = 1/fsH; % New sampling interval
t=0:1/fsH:lx; % New discrete time intervals = 1/fsH
xHat = 0; % initializing the new reconstructed signal xHat
% sinc interpolation with amplitude equal the sample and shifted one interval
for n=1:nx
    m = n-1; % because Matlab does not have index of value zero
    xHat = xHat + xn(n)*sinc((t-m*Ts)/Ts);
end
stem(ts, xn) % plot the original samples.
hold on
plot(t,xHat) % plot the reconstructed signal, with delay.