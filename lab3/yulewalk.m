function yulewalk(Fs, N)
    % Fs - sample rate, default be 500Hz
    % N - order of the filter, default be 8
    fig = figure;
    % sequence of 251 points representing the filter and the frequency
    F = linspace(0, 1, 251);
    % stopband from 55-65 Hz
    M = [ones(1, 55), linspace(1, 0, 10), zeros(1, 251-65)];
    % yulewalk is a function that returns the transfer function
    % coefficients of an 8th-order IIR filter whose frequency magnitude
    % response approximately matxhes the values given in F and M
    [B, A] = yulewalk(N, F, M);
    
    % graph frequency response
    [h, w] = freqz(B, A, Fs);
    plot(F*Fs/2, 20*log10(M), w*Fs/(2*pi), 20*log10(abs(h)), '--');
    % figure captions and other components
    legend('Ideal', 'yulewalk Designed');
    title('Comparison of Frequency Response Magnitudes');
    xlabel('Frequency (Hz)');
    ylabel('Magnitude (dB)');
    % save the figure
    saveas(fig, 'CFRM.png');