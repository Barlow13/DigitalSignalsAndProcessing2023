%% Task 1.a

[y,fs] = audioread("Music.wav");
[QntzSig Delta] = QuantizationMB(y,4,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,3,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,2,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,1,1);
sound(QntzSig,fs)

[y,fs] = audioread("Song.wav");
[QntzSig Delta] = QuantizationMB(y,4,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,3,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,2,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,1,1);
sound(QntzSig,fs)

[y,fs] = audioread("Sentence.wav");
[QntzSig Delta] = QuantizationMB(y,4,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,3,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,2,1);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,1,1);
sound(QntzSig,fs)

% The sentence was affected the most by downsampling

%% Task 1.b

[y,fs] = audioread("Sentence.wav");
[QntzSig Delta] = QuantizationMB(y,3,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,3,2);
sound(QntzSig,fs)



% It sounded better when using rounding symetric. It helped to capture the inbetween values better

%% Task 1.c

[y,fs] = audioread("SentenceNoise.wav");
[QntzSig Delta] = QuantizationMB(y,4,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,4,2);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,3,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,3,2);
sound(QntzSig,fs)
[QntzSig Delta] = QuantizationMB(y,2,1);
sound(QntzSig,fs);
[QntzSig Delta] = QuantizationMB(y,2,2);
sound(QntzSig,fs)


% The rounding symetric has increases the noise yet does not lose the internal message of the signal, while the rounding asymetric cuts out the noise but also loses the intenral message.


