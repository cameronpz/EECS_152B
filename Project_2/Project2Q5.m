n = 1:1000; %size [1 1000]
x = sin(2*pi*n/20); %size [1 1000]

%Plot 20 kHz Sampled Signal
figure(1);
plot(n/20000,x);
title('Fs = 20 kHz');
xlabel('Time (secs)');
ylabel('Amplitude');

%Downsample w/ no Filter
xd = downsample(x,5);
nd = 1:200; %downsample by 5 thus 1/5 # of pts
figure(2);
plot(nd/4000,xd);
title('4 kHz Sampling w/ No Filter');
xlabel('Time (secs)');
ylabel('Amplitude');

%Downsample w/ Filter 
hlp = firpm(101,[0 0.2 0.3 1],[1 1 0 0]);
c = conv(hlp,x);
%size [1 1101]
xd2 = downsample(c,5);
%size [1 221]
nd2 = 1:221;
figure(3);
plot(nd2/4000,xd2);
title('4 kHz Sampling w/ Filter');
xlabel('Time (secs)');
ylabel('Amplitude');

sound(x,20000);
pause(3);
sound(xd,4000);
pause(3);
sound(xd2,4000);
