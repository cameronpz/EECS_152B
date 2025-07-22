%ad1 = 5, ai1 = -25, ai2 = 7
%n = 100,000 16 antennas
load('ABF.mat');
ad1 = linarr(16,5,0.5); % column vector 16x1
ai1 = linarr(16,-25,0.5); % column vector 16x1
ai2 = linarr(16,7,0.5); % column vector 16x1
sd1 = nursie(1:100000).'; % row vector 1x100,000
si1 = 100*(babble(1:100000).'); % row vector 1x100,000
si2 = 100*(jetnoise(1:100000).'); % row vector 1x100,000
noise = 0.05*(randn(16,100000)+1j*randn(16,100000));
X = ad1*sd1+ai1*si1+ai2*si2+noise; % 16x100,000

%q2 T = 100
A = [ad1 ai1 ai2]; %16x3
c = [1 0 0]'; %3x1
Xn = X(1:16,1:100); %16x100
%gives me time data from first 100 time units
Z = Xn*Xn'; %16x16
Rxx = Z/100; %16x16
Ri = inv(Rxx); %16x16
g = Ri*A*inv(A'*Ri*A)*c;
h = conj(g);
sound(real(nursie(1:100000)),22000);
pause(8);
y = h.'*X;
sound(real(y),22000);