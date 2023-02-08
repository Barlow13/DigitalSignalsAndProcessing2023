clear all
[y,fs] = audioread("BirdSong.wav")
MonoSig = y(:,1);
Down2 = fs/2;
Down7 = fs/7;

Sig = resample(MonoSig, Down2, 44100);
Sig2 = resample(MonoSig, Down7, 44100);

%sound(MonoSig,fs);
%sound(Sig, Down2);
sound(Sig2, Down7);

figure(1)
spectrogram(MonoSig,fs,64,0:10:fs/2,fs,'yaxis')
figure(2)
spectrogram(Sig,Down2,64,0:10:fs/2,fs,'yaxis')
figure(3)
spectrogram(Sig2,Down7,64,0:10:fs/2,fs,'yaxis')
