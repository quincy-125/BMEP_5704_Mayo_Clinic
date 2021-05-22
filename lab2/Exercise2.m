function Exercise2(t)
    % t be the sample times, default value be [0:1:5000], 5000 total points
    % 2 sin signal saves
    ya = sin(2 * pi * 10 * t / 5000) + 0.5;
    yb = sin(2 * pi * 100 * t / 5000) + 0.5;
    % sum of 2 sin waves
    x = ya + yb;
    
    fig1 = figure;
    % plot x in time domain
    plot(t, x);
    saveas(fig1, 'fig_x.png');
    
    % movmean func generates an array of local k-point mean values, where
    % each mean is calculated over a sliding window of length k across
    % neighboring elements of A
    % x3 is for sliding window of 3
    x3 = movmean(x,3);
    % x51 is for sliding window of 51
    x51 = movmean(x, 51);
    % x501 is for sliding window of 501
    x501 = movmean(x, 501);
    
    % ploting x, x3, x51, x501 and their corresponding with noise pulse in
    % time domain
    fig2 = figure;
    
    subplot(2, 2, 1);
    plot(t, x);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 2, 2);
    plot(t, x3);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 2, 3);
    plot(t, x51);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 2, 4);
    plot(t, x501);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    saveas(fig2, 'fig_movmean.png')