function AmPlot(idx, m, c, u, rng)
    % idx: x index (it can represent time or frequency)
    % m: modulating signal
    % c: carrier signa;
    % u: modulated signal
    % rng: range of x axis to plot (optional)
    if nargin < 5; rng = 1; end % default value for rng
    figure;
    subplot (3, 1, 1);
    plot(idx, m); grid on;
    axis([rng*min(idx) rng*max(idx) min(m)-0.1 max(m)+ 0.1]);
    subplot(3, 1, 2);
    plot(idx, c); grid on;
    axis([rng*min(idx) rng*max(idx) min(c)-0.1 max(c)+0.1]);
    subplot(3, 1, 3);
    plot(idx, u); grid on;
    axis([rng*min(idx) rng*max(idx) min(u)-0.1 max(u)+0.1]);
end
