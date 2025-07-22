hpm = firpm(29,[0 0.145 0.25 1],[1 1 0 0],[1 50]); 
%ideal cut off is 0.131
n = -14.5:1:14.5; %30 antennas
h = hpm.*exp(-1j*pi*n*0.216); %shift left
hflip = fliplr(h); % time reversal 
[H,w] = dtft(hflip,1000); %dtft
deg = (180/pi)*asin(w/pi); %convert to degrees
plot(deg,20*log10(abs(H))), xlabel('Degrees'), ...
   ylabel('Gain'), title ('Gain vs Degrees');
xticks(-80:5:80)
grid
yticks([-50 -40 -30 -2 0 2])
