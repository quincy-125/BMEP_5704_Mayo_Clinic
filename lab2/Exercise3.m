function Exercise3(wl, wh)
    % wl is a normalized cutoff frequency of FIR lowpass filter, default
    % value be 0.7 rad/sec Hz
    % 50th order of FIR lowpass filter
    lowpass = fir1(50, wl, 'low');
    figl = figure;
    % graph frequency response
    freqz(lowpass);
    saveas(figl, 'lowpass.png');
    
    % wh is a normalized cutoff frequency of FIR highpass filter, default
    % value be 0.3 rad/sec Hz
    % 50th order of FIR highpass filter
    highpass = fir1(50, wh, 'high');
    figh = figure;
    % graph frequency response
    freqz(highpass);
    saveas(figh, 'highpass.png');
    
    % FIR bandpass filter with normalized cutoff frequency of 0.3 rad/sec 
    % and 0.7 Hz
    % 50th order of FIR bandpass filter
    bandpass = fir1(50, [wh wl], 'bandpass');
    figb = figure;
    % graph frequency response
    freqz(bandpass);
    saveas(figb, 'bandpass.png')