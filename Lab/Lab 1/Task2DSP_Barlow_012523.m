To = 2; % This effects the window size...
% Ask for help with how the window size correlates to X[k]
fs = 10;
ts = 0:1 / fs:(To -1 / fs);
xn = 1 + 0.25 * cos(2 * pi * 2.5 * ts - pi / 4) + 0.5 * cos(2 * pi * 4 * ts);
figure(1)
stem(ts, xn); %plot xn using stem function
Fx = fftshift((fft(xn)));
figure(2)
stem ([-fs/2: 1/To: fs/2-1/To], abs(Fx));
figure(3)
stem ([-fs/2: 1/To: fs/2-1/To], angle(Fx) .* (abs(Fx) > 0.5));
xr = ifft(ifftshift(Fx));
