function Elliptical(Fs)
    % Fs - sample rate, default be 500Hz
    % passband 0-30 Hz
    Wp = 30 / (Fs / 2);
    % stopband 100Hz
    Ws = 100 / (Fs / 2);
    % 3 dB ripple in passband
    % 80 dB attenuation in stopband
    % ellipord returns the lowest order, n, of the digital elliptic filter
    % with no more than Rp dB of passband ripple and at least Rs dB of
    % attenuation in the stopband
    [n, Wn] = ellipord(Wp, Ws, 3, 80);
    % ellip function returns the transfer function coefficients of an
    % 8th-order lowpass digital elliptic filter with normalized passband
    % edge ferquency Wp. 
    [z, p, k] = ellip(n, 3, 80, Wn);
    % zp2sos function fins a 2nd-order section matrix Sos with gain g that
    % is equivalent to the transfer function H(z) whose n zeros, m poles,
    % and scalar gain are specified in z, p, and k. 
    Sos = zp2sos(z, p, k);
    
    fig = figure;
    % graph the frequency response
    freqz(Sos, 512, 500);
    % add figure captions
    title(sprintf('n=%d Pole Elliptical Lowpass Filter', n));
    % save the figure
    saveas(fig, 'Pole Elliptical Lowpass Filter.png');