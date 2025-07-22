n = -125:1:125; %101 antennas
win = hamming(251); %hamming window
h = exp(1j*(0.017452*pi)*n)+exp(1j*(0.0348995*pi)*n);
%1 degree and 2 degrees
hf = (win').*h; %window impulse
[H,w] = dtft(hf,1350); %dtft
deg = (180/pi)*asin(w/pi); %convert to degrees
plot(deg,20*log10(abs(H))), xlabel('Degrees'), ...
   ylabel('Gain'), title ('Gain vs Degrees');
xticks(-80:5:80)
grid