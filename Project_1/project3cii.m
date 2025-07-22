n = -14.5:1:14.5; %30 antennas
win = hamming(30); %hamming window
h = exp(1j*(-0.275*pi)*n)+exp(1j*(-0.155*pi)*n);
%-15.962 degrees and -8.917 degrees
hf = (win').*h; %window impulse
[H,w] = dtft(hf,500); %dtft
deg = (180/pi)*asin(w/pi); %convert to degrees
plot(deg,20*log10(abs(H))), xlabel('Degrees'), ...
   ylabel('Gain'), title ('Gain vs Degrees');
xticks(-80:5:80)
grid