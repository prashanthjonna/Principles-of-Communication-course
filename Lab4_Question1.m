clc;clear;close all;

fm = 200;
fc = 2000;
Ac = 2;
Am = 2;
Sampling_rate = 50000;

% question 1 part (a)

t = 0:1/Sampling_rate:5/200;
message_signal = Am*cos(2*pi*fm*t);
subplot(4,2,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Message signal m(t)");
axis([0,5/200,-2,2]);

% question 1 part (b)

carrier_signal = Ac*cos(2*pi*fc*t);
subplot(4,2,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q1(b) : Carrier signal c(t)");
axis([0,5/200,-2,2]);


% question 1 part (c)

DSBSC_signal = message_signal.*carrier_signal;
subplot(4,2,3);
plot(t,DSBSC_signal);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : DSB-SC signal phi(t)");

% question 1 part (d)

freq = (-Sampling_rate/2:40:Sampling_rate/2);
mt_final = fftshift(fft(message_signal));
ct_final = fftshift(fft(carrier_signal));
DSBSC_final = fftshift(fft(DSBSC_signal));

subplot(4,2,4);
plot(freq,mt_final/length(freq));
grid on;
title("Q1(d) : Freq Spectrum of m(t)");
xlabel("Frequency(Hz)");
ylabel("m(t)");
axis([-2000,2000,-0.1,1.1]);

subplot(4,2,5);
plot(freq,ct_final/length(freq));
grid on;
title("Q1(d) : Freq Spectrum of c(t)");
xlabel("Frequency(Hz)");
ylabel("c(t)");
axis([-10000,10000,-0.1,1.1]);

subplot(4,2,6);
plot(freq,DSBSC_final/length(freq));
grid on;
title("Q1(d) : Freq Spectrum of DSBSC-signal(t)");
xlabel("Frequency(Hz)");
ylabel("phi(t)");
axis([-10000,10000,-0.1,1.1]);

% question 1 part (e)

sync_demod_output = lowpass(DSBSC_signal .* carrier_signal,200,Sampling_rate);
sync_demod_output = (sync_demod_output/2);

subplot(4,2,7);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(4,2,8);
plot(freq,sync_demod_final/length(freq));
grid on;
title("Q1(e) : Freq Spectrum of sync. output");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,1.1]);

