load("C:\Users\camer\Documents\MATLAB\Project 2\tchaikovsky.mat");
sound(sugar_plum(300000:800000), 44100); %sample at 44.1 kHz
song = sugar_plum(300000:800000);
pause(15);

%SRC of 3/2
up = upsample(song,3);
h = triang(3);
c = conv(up,h);
dwn = downsample(c,2);
sound(dwn,66150);
pause(15);

%SRC of 9/2
up = upsample(song,9);
h = triang(9);
c = conv(up,h);
dwn = downsample(c,2);
sound(dwn,198450);
pause(15);
