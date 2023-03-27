[Sig, sr]=audioread('Song.wav');
SigLength = length(Sig);
SigClipped=zeros(1,SigLength);
for i=1:SigLength
if Sig(i) > 0
SigClipped(i)=0.5;
elseif Sig(i) < 0
SigClipped(i)=-0.5;
end
end
sound(SigClipped, sr)