n = -14.5:1:14.5; %30 antennas
w1 = -0.342*pi;
w2 = -0.087*pi;
win = hamming(30); %hamming window
h = exp(1j*w1*n)+exp(1j*w2*n);
hf = (win').*h; %window impulse
[H,w] = dtft(hf,500); %dtft
deg = (180/pi)*asin(w/pi); %convert to degrees
plot(deg,20*log10(abs(H))), xlabel('Degrees'), ...
   ylabel('Gain'), title ('Gain vs Degrees');
xticks(-80:5:80)
grid