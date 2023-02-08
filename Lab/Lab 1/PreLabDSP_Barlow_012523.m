clear all
A = 5;
taw = 5;
SampRate = 1000;
t = -5:1 / SampRate:5;
xt = A * ((t >= -taw / 2) & (t <= taw / 2));
figure(1);
plot(t, xt);
axis([-5 5 -1 6])
Xw = fft(xt);
Xw = abs(fftshift(Xw));
FreqResoulution = 1/ (max(t)-min(t));
Fmax = SampRate/2;
FreqAxis=-Fmax:FreqResoulution:Fmax;
figure(2);
plot(FreqAxis,Xw);

