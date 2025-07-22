load("C:\Users\camer\Documents\MATLAB\Project 2\tchaikovsky.mat");
sound(sugar_plum(300000:500000), 44100); %sample at 44.1 kHz
song = sugar_plum(300000:500000);
pause(5);

%SRC of 3/2
up = upsample(song,3);
hlp = firpm(101,[0 0.333 0.433 1],[3 3 0 0]);
c = conv(up,hlp);
dwn = downsample(c,2);
sound(dwn,66150);
pause(5);

%SRC of 9/2
up = upsample(song,9);
hlp = firpm(101,[0 0.111 0.211 1],[9 9 0 0]);
c = conv(up,hlp);
dwn = downsample(c,2);
sound(dwn,198450);
pause(5);
