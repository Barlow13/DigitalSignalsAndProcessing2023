function [xHat fsH] = SincInterpolationBPF(xn,fs)
nx = length(xn);
Ts = 1/fs;
lx = Ts*(nx-1);
fsH = 7*fs;
T = 1/fsH;
t=0:T:lx;
xHat = 0;
for n=1:nx
    m = n-1
    xHat = xHat + xn(n)*sinc((t-m*Ts)/Ts).*cos(2*pi*4500*(t-m*Ts));
end

