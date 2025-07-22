N = 40; %21 samples gets everything but the top part
w = -1:2/N:1;
%plot(w, batman(w)); %batman is a row vector
y = batman(w); %DFT of batman(w)
z = fftshift(y); %go from -pi to pi => 0 to 2pi
h = ifft(z); %back to time
[H, w] = dtft(h,41);
plot(w/pi, abs(H)), xlabel('Normalized Frequency'), ...
   ylabel('Gain'), title ('Gain vs Normalized Frequency');
grid 

