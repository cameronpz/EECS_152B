b=firpm(60,[0 0.2 0.25 0.35 0.4 0.6 0.65 0.75 0.8 1],...
    [0 0 0.635 0.635 1.06 1.06 0.635 0.635 0 0],[21 1 1 1 21]);
%61 samples, frequency ranges are specificed from question
%magnitude ranges: wanted dB range/2, then modifying from there
%weights: the stopbands are weighted heavily

%dtft of firpm 
[B,w]=dtft(b,1000);
%plot dB gain
plot(w/pi,20*log10(abs(B))), axis([0 1 -70 10]), xlabel('Normalized Frequency'), ...
    ylabel('dB Gain'), title ('dB Gain vs Normalized Frequency');
grid
xticks(0:0.05:1)
yticks([-50 -5 -3 0 1])
%add ticks to see if requirements are met