function Exercise1(t) 
    % t be the sample times, default value be [0:1:5000]
    % rectpuls func generates a rectangle puls with sample times be t-2500 
    % and width be 3000
    % specific for x, we have the amplitude be 5
    x = 5 * rectpuls(t-2500, 3000);
    % movmean func generates an array of local k-point mean values, where
    % each mean is calculated over a sliding window of length k across
    % neighboring elements of A
    % x3 is for sliding window of 3
    x3 = movmean(x, 3);
    % x51 is for sliding window of 51
    x51 = movmean(x, 51);
    % x501 is for sliding window of 501
    x501 = movmean(x, 501);
    
    % using rand func to add noise for x, x3, x51, and x501
    xn = x + rand(size(x));
    x3n = x3 + rand(size(x3));
    x51n = x51 + rand(size(x51));
    x501n = x501 + rand(size(x501));
    
    % ploting x, x3, x51, x501 and their corresponding with noise pulse in
    % time domain
    fig = figure;
    
    subplot(2, 4, 1);
    plot(t, x);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 2);
    plot(t, xn);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 3);
    plot(t, x3);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 4);
    plot(t, x3n);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 5);
    plot(t, x51);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 6);
    plot(t, x51n);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 7);
    plot(t, x501);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    subplot(2, 4, 8);
    plot(t, x501n);
    xlim([0, 5000]);
    ylim([-1, 6]);
    
    % save all subplots in single png file
    saveas(fig, 'E1.png');
    
    