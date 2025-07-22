%ad1 = 5, ai1 = -25, ai2 = 15, ai3 = 0
%n = 100,000 16 antennas
load('ABF.mat');
ad1 = linarr(16,5,0.5); % column vector 16x1
ai1 = linarr(16,-25,0.5); % column vector 16x1
ai2 = linarr(16,15,0.5); % column vector 16x1
ai3 = linarr(16,0,0.5); % column vector 16x1
sd1 = nursie(1:100000).'; % row vector 1x100,000
si1 = 100*(babble(1:100000).'); % row vector 1x100,000
si2 = 100*(jetnoise(1:100000).'); % row vector 1x100,000
JN = 100*(jetnoise(1:50000).'); % row vector 1x50,000
Z = zeros(1,50000); % row vector 1x50,000
si3 = [Z JN]; %halfway through, jet noise begins
noise = 0.05*(randn(16,100000)+1j*randn(16,100000));
X = ad1*sd1+ai1*si1+ai2*si2+ai3*si3+noise; %16x100,000

A = [ad1 ai1 ai2]; %16x3
c = [1 0 0]'; %3x1


N = 20; % sample window
%this is a rectangular window
e = 0.0005;
Hat0 = zeros(1,100000-N); %allocate memory for the Hat vector
y = zeros(1,100000-N); %allocate memory for the output vector
for n=1:100000-N 
    Z = X(1:16,n:N+n-1)*X(1:16,n:N+n-1)'; %16x16
    Rxx_n = Z/N; %16x16
    if n==1
        Rxx_np1=Rxx_n; %for first sample, they equal
    else
        Rxx_np1 = (1-e)*Rxx_np1 + e*Rxx_n; 
        %New value = (1-e)*old value + e*current value
    end
    
    Ri = inv(Rxx_np1); %16x16
    g = Ri*A*inv(A'*Ri*A)*c;
    h = conj(g);
    y(n) = h.'*X(1:16, n); %puts in data into output vector
    [H,ws]=dtft(h,500);
    Hat0(n) = H(251); %stores the frequency response at 0 degrees 
end 
m=1:100000-N;
plot(m,20*log10(abs(Hat0))), xlabel('Time'), ...
    ylabel('dB Gain'), title ('dB Gain vs Time');
    grid


sound(real(nursie(1:100000)),22000);
pause(5);
sound(real(y),22000);




