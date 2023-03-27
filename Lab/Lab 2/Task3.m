f0=1600;               % the frequency of the tone
fs = 4200;             % sampling rate
ts = 0:1/fs:2;         % samples for 2 second with sampling interval = 1/fs
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);
f0=1800;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);
f0=1900;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);
f0=2300;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);
f0=2400;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(5);
f0=1800;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);
f0=2400;               % the frequency of the tone
x=0.8*sin(2*pi*f0*ts); % samples of the continuous tone signal
sound(x,fs)
pause(3);