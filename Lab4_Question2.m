clc;clear;close all;

f1 = 250;
f2 = 350;
fc = 2500;
A_c = 1;
A1 = 1;
A2 = 1;
Sampling_rate = 60000;

% question 2 part (a)

t = 0:1/Sampling_rate:5/f1;
signal_1 = A1*cos(2*pi*f1*t);
subplot(4,2,1);
plot(t,signal_1);
grid on;
xlabel("Time(sec)");
ylabel("signal value");
title("Q2(a) : signal A1*cos(2*pi*f1*t)");
%axis([0,0.02,-1,1]);

% question 2 part (b)

signal_2 = A2*cos(2*pi*f2*t);
subplot(4,2,2);
plot(t,signal_2);
grid on;
xlabel("Time(sec)");
ylabel("signal value");
title("Q2(b) : signal A2*cos(2*pi*f2*t)");
%axis([0,0.02,-1,1]);

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(4,2,3);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("carrier value");
title("Q2(b) : carrier signal c(t)");
%axis([0,0.02,-1,1]);

% question 2 part (c)

message_signal = signal_1 + signal_2;
freq = (-Sampling_rate/2:1/0.02:Sampling_rate/2);
mt_final = fftshift(fft(message_signal));
ct_final = fftshift(fft(carrier_signal));

subplot(4,2,4);
plot(freq,mt_final/length(freq));
grid on;
title("Q2(c) : Freq Spectrum of m(t)");
xlabel("Frequency(Hz)");
ylabel("m(t)");
axis([-4000,4000,-0.1,0.6]);

subplot(4,2,5);
plot(freq,ct_final/length(freq));
grid on;
title("Q2(c) : Freq Spectrum of c(t)");
xlabel("Frequency(Hz)");
ylabel("c(t)");
axis([-4000,4000,-0.1,0.5]);

% question 2 part (d)

DSBSC_signal = A_c*(message_signal).*cos(2*pi*fc*t);
DSBSC_final = fftshift(fft(DSBSC_signal));
subplot(4,2,6);
plot(freq,DSBSC_final/length(freq));
grid on;
xlabel("Frequency(Hz)");
ylabel("s(t)");
title("Q2(d) : Freq. spectrum of s(t)");
axis([-4000,4000,-0.1,0.5]);

% question 2 part (e)

DSBSC_signal = message_signal.*carrier_signal;
carrier_signal = A_c*cos(2*pi*fc*t);
sync_demod_output = lowpass(DSBSC_signal .* carrier_signal,220,Sampling_rate);
sync_demod_output = (sync_demod_output)/(((A_c^2)/2));
subplot(4,2,7);
plot(t,sync_demod_output);
grid on;
title("Q2(e) : Sync. demod output");
xlabel("time(s)");
ylabel("sync-demod-output");


sync_demod_final = fftshift(fft(sync_demod_output));
subplot(4,2,8);
plot(freq,sync_demod_final/length(freq));
grid on;
title("Q2(e) : Freq Spectrum of sync. demod output");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-4000,4000,-0.1,0.5]);