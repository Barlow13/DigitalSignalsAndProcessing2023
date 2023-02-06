fs = 44100;
len = 2; % length of signals in seconds
t = (-len / 2):1 / fs:(len / 2); % time index
% Generate the message signal m(t)
f1 = 400; f2 = 700;
m = 1 + 0.25 * cos(2 * pi * f1 * t) + 0.5 * cos(2 * pi * f2 * t);
% generate the carrier signal c(t)
fc = 5000; % carrier frequency
c = cos(2 * pi * fc * t);
% modulate the signal
u = m .* c;
% Let's plot them in time to see how they look like
AmPlot(t, m, c, u, 5 / f1);
% calculate the spectra
M = abs(fftshift(fft(m)));
C = abs(fftshift(fft(c)));
U = abs(fftshift(fft(u)));
% Make the frequency index for plotting
f = (-fs / 2):(1 / len):(fs / 2);
% Now lets plot them in frequency
AmPlot(f, M, C, U, 3 * fc / fs)

%sound(m);
%sound(c);
%sound(u);
