function [QntzSig Delta] = QuantizationMB(OrgSig, B, QM)
% OrgSig is the original audio file or signal
% B is the number of bits per sample
% QM can be 1 for Rounding Asymmetric, 2 for Rounding Symmetric
% 3 for Truncating Asymmetric, 4 for Truncating Symmetric
Vref = max(abs(OrgSig));
Delta = Vref/(2^(B-1))
if QM == 1
 QntzSig = Delta*floor(OrgSig/Delta + 1/2);
elseif QM ==2
 QntzSig = Delta*(floor(OrgSig/Delta) + 1/2);
elseif QM == 3
 QntzSig = Delta*floor(OrgSig/Delta);
elseif QM == 4
 QntzSig = Delta*(floor(OrgSig/Delta - 1/2) + 1/2);
end
% the following statements check if the quantized level bigger
%than the maximum level then it set it to the maximum level.
if (QM == 1)|(QM==3)
 QntzSig(QntzSig >(Vref-Delta)) = Vref-Delta;
 QntzSig(QntzSig <-Vref) = -Vref;
else
 QntzSig(QntzSig >(Vref-Delta/2)) = Vref - Delta/2;
 QntzSig(QntzSig <-(Vref-Delta/2)) = -Vref + Delta/2;
end
end