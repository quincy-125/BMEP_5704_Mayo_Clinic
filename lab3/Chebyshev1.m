function Chebyshev1(Fs)
    % Fs - sample rate, default be 500Hz
    % passband 0-30 Hz
    Wp = 30 / (Fs / 2);
    % stopband 100Hz
    Ws = 100 / (Fs / 2);
    % 3 dB ripple in passband
    % 80 dB attenuation in stopband
    % cheb1ord function returns the lowest order of n of the Chebyshev Type
    % I filter that loses no more than Rp dB in the passband and has at
    % least Rs dB of attenuation in the stopband. the scalar (or vector) of
    % corresponding cutoff frequencies Wp is also returned
    [n, Wn] = cheb1ord(Wp, Ws, 3, 80);
    % cheby1 function returns the transfer function coefficients of an
    % nth-order lowpass digital Chebyshev Type I filter with normalized
    % passband edge frequency Wp and Rp decibels of peak-to-peak passband
    % ripple
    [z, p, k] = cheby1(n, 3, Wn);
    % zp2sos function fins a 2nd-order section matrix Sos with gain g that
    % is equivalent to the transfer function H(z) whose n zeros, m poles,
    % and scalar gain are specified in z, p, and k. 
    Sos = zp2sos(z, p, k);
    
    fig = figure;
    % graph the frequency response
    freqz(Sos, 512, 500);
    % add figure captions
    title(sprintf('n=%d Pole Chebyshev 1 Lowpass Filter', n));
    % save the figure
    saveas(fig, 'Pole Chebyshev 1 Lowpass Filter.png');