clear all
[y,fs] = audioread("BirdSong.wav");
MonoSig = y(1:150000,1);
Down2 = round(fs/2);
Down7 = round(fs/7);
Bird1 = bandpass(MonoSig, [3000 6000],fs);
n=1;
for i = 1:2:length(Bird1)
    Bird2(n) = Bird1(i);
    n=n+1;
end
n = 1;
for i = 1:7:length(Bird1)
    Bird3(n) = Bird1(i);
    n=n+1;
end


%[xHat fsH] = SincInterpolationBPF(Bird3,Down7);
%Bird3Reconstruct = bandpass(xHat, [3000 6000],fsH);
%sound(Bird3Reconstruct, fsH)
Window = round(0.025*fs);
NoOverlap = round(0.005*fs);
Freq = 0:100:round(fs/2);
Window2 = round(Window/2);
NoOverlap2 = round(NoOverlap/2);
Freq2 = 0:100:round(Down2/2);
Window7 = round(Window/7);
NoOverlap7 = round(NoOverlap/7);
Freq7 = 0:100:round(Down7/2);

figure(1)
spectrogram(Bird1,Window,NoOverlap,Freq,fs,'yaxis')
title('Orignal')
figure(2)
spectrogram(Bird2,Window2,NoOverlap2,Freq2,Down2,'yaxis')
title('Down 2')
figure(3)
spectrogram(Bird3,Window7,NoOverlap7,Freq7,Down7,'yaxis')
title('Down 7')