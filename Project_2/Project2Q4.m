%x = sin(2*pi*1000*t);
%this would be my signal in time 
n = 0:1000; %size [1 1001]
ni = 0:5105; %size [1 5106]
%Fs = 20 kHz
%x = sin(2*pi*1000*n*5*10^(-5));
x = sin(2*pi*n/20); %size [1 1001]
%up sample to 100 kHz => I = 5
Z = [x;zeros(4,1001)]; % add 4 zeros in between each sample
z = Z(:); % convert to column vector
xe = z'; % convert to row vector 
%xe is the up sampled version
hlp = firpm(100,[0 0.2 0.3 1],[5 5 0 0]);
xi = conv(hlp, xe);
%xi is size [1 5106]
%this is the interpolated signal

%Plot 20 kHz Sampled Signal
figure(1);
plot(n/20000,x);
title('Fs = 20 kHz');
xlabel('Time (secs)');
ylabel('Amplitude');
%Plot 100 kHz Sampled Signal
figure(2)
plot(ni/100000,xi);
title('Fs = 100 kHz');
xlabel('Time (secs)');
ylabel('Amplitude');
sound(xe, 100000);
%sound after inserting zeros
sound(xi, 100000);
%sound after interpolation
