wc = 0.5*pi;
m = -46:46; %row vector
n = m+0.0001; %move points by 0.0001 in order to avoid the undefined point of sin(0)/0
win = hamming(93); %hamming window
hbp1 = (win').*((10^(0.04))*exp(1j*wc*n).*sin(0.125*pi*n)./(pi*n)); %center bandpass
hbp2 = (win').*((10^(-0.155))*exp(1j*0.3*pi*n).*sin(0.0638*pi*n)./(pi*n)); %left bp 
hbp3 = (win').*((10^(-0.155))*exp(1j*0.7*pi*n).*sin(0.0638*pi*n)./(pi*n)); %right bp
%transpose column vector to row vector
h = hbp1 + hbp2 + hbp3;
%add up all the bandpass filters
%dtft of the impulse response
[H,w]=dtft(h,500);
plot(w/pi,20*log10(abs(H))), axis([0 1 -70 10]), xlabel('Normalized Frequency'), ...
    ylabel('dB Gain'), title ('dB Gain vs Normalized Frequency')
grid
xticks(0:0.05:1)
yticks([-50 -5 -3 0 1])
%add ticks in order to see if requirements are met