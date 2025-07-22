%ad1 = 5, ai1 = -25, ai2 = 5.1
%n = 100,000 50 antennas
load('ABF.mat');
ad1 = linarr(50,5,0.5); % column vector 50x1
ai1 = linarr(50,-25,0.5); % column vector 50x1
ai2 = linarr(50,5.1,0.5); % column vector 50x1
sd1 = nursie(1:100000).'; % row vector 1x100,000
si1 = 100*(babble(1:100000).'); % row vector 1x100,000
si2 = 100*(jetnoise(1:100000).'); % row vector 1x100,000
noise = 0.05*(randn(50,100000)+1j*randn(50,100000));
X = ad1*sd1+ai1*si1+ai2*si2+noise; % 50x100,000

%q2 T = 100

A = [ad1 ai1 ai2]; %50x3
c = [1 0 0]'; %3x1
Xn = X(1:50,1:100); %50x100
%gives me time data from first 100 time units
Z = Xn*Xn'; %50x50
Rxx = Z/100; %50x50
Ri = inv(Rxx); %50x50
g = Ri*A*inv(A'*Ri*A)*c;
h = conj(g);
[H,ws]=dtft(h,500);
thax=(180/pi)*asin(ws/pi);
plot(thax,20*log10(abs(H))), xlabel('Degrees'), ...
    ylabel('dB Gain'), title ('dB Gain vs Degrees');
grid
hold
plot([5 5],[-50 10],'k--');
plot([-25 -25],[-50 10],'r--');
plot([5.1 5.1],[-50 10],'r--');
sound(real(nursie(1:100000)),22000);
pause(8);
y = h.'*X;
sound(real(y),22000);