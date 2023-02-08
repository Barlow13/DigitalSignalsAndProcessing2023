clear all
Fs = 8000;                                      % sampling frequency
Wind = 0.1;                                     % time interval for calculating the Fourier transform (FT) is 0.1 seconds

NumSampWind = Fs*Wind;                          % number of samples in the window for calculating the Fourier Transform

t1 = 0:1/Fs:3;                                  % time scale from zero to 3 seconds
t = 0:1/Fs:1;                                   % time scale from zero to 1 seconds
ZeroTime = zeros(1,length(t)-1);
t2 = [ZeroTime t ZeroTime];                     % first and third seconds are zeros
Freq = [0:10:4000];                             % frequency at which the Fourier transform will be calculated

Sig = 3*sin(2*pi*500*t1)+sin(2*pi*2000*t2);     % sin(2π500t) for 0<t<3 and sin(2π2000t) for 1<t<2
figure(1)
spectrogram(Sig,NumSampWind,64,Freq,Fs,'yaxis') % calculate the FT and plot spectrum where time in x-axis and % frquency in y-axis