load("C:\Users\camer\Documents\MATLAB\Project 2\tchaikovsky.mat");
sound(sugar_plum(300000:500000), 44100); %sample at 44.1 kHz
song = sugar_plum(300000:500000);
pause(5);

%SRC of 5/6
up = upsample(song,5);
hlp = firpm(101,[0 0.166 0.266 1],[5 5 0 0]);
c = conv(up,hlp);
dwn = downsample(c,6);
sound(dwn,36750);
pause(5);

%SRC of 2/3
up = upsample(song,2);
hlp = firpm(101,[0 0.333 0.433 1],[2 2 0 0]);
c = conv(up,hlp);
dwn = downsample(c,3);
sound(dwn,29400);
pause(5);

%SRC of 1/2
dwn = downsample(song,2);
sound(dwn,22050);
pause(5);

%SRC of 1/3
dwn = downsample(song,3);
sound(dwn,14700);
pause(5);
%slight muffle

%SRC of 1/6
dwn = downsample(song,6);
sound(dwn,7350);
pause(5);
%definite muffle






