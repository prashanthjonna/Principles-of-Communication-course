clc;clear;close all;

f1 = 100;
f2 = 200;
fc = 2000;
A_c = 1;
A1 = 1;
A2 = 1;
Sampling_rate = 50000;

% question 2 part (a)

t = 0:1/Sampling_rate:2/f1;
signal_1 = A1*cos(2*pi*f1*t);
subplot(5,4,1);
plot(t,signal_1);
grid on;
xlabel("Time(sec)");
ylabel("signal value");
title("Q2(a) : signal A1*cos(2*pi*f1*t)");
%axis([0,0.02,-1,1]);

% question 2 part (b)

signal_2 = A2*cos(2*pi*f2*t);
subplot(5,4,2);
plot(t,signal_2);
grid on;
xlabel("Time(sec)");
ylabel("signal value");
title("Q2(b) : signal A2*cos(2*pi*f2*t)");
%axis([0,0.02,-1,1]);

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(5,4,3);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("carrier value");
title("Q2(b) : carrier signal c(t)");
%axis([0,0.02,-1,1]);

% question 2 part (c)

message_signal = signal_1 + signal_2;
message_h = A1*cos((2*pi*f1*t) - pi/2) + A2*cos((2*pi*f2*t) - pi/2);
SSBSC_signal_USB = A_c*message_signal.*cos(2*pi*fc*t) - A_c*message_h.*sin(2*pi*fc*t);
subplot(5,4,4);
plot(t,SSBSC_signal_USB);
grid on;
xlabel("Time(sec)");
ylabel("phi(t) value");
title("Q2(c):SSBSC Signal USB transmission");

SSBSC_signal_LSB = A_c*message_signal.*cos(2*pi*fc*t) + A_c*message_h.*sin(2*pi*fc*t);
subplot(5,4,5);
plot(t,SSBSC_signal_LSB);
grid on;
xlabel("Time(sec)");
ylabel("phi(t) value");
title("Q2(c):SSBSC Signal LSB transmission");

% question 2 part (d)

freq = (-Sampling_rate/2:1/0.02:Sampling_rate/2);
mt_final = fftshift(fft(message_signal));
ct_final = fftshift(fft(carrier_signal));
SSBSC_final_USB = fftshift(fft(SSBSC_signal_USB));
SSBSC_final_LSB = fftshift(fft(SSBSC_signal_LSB));

subplot(5,4,6);
plot(freq,abs(mt_final/length(freq)));
grid on;
title("Q2(d) : Freq Spectrum of m(t)");
xlabel("Frequency(Hz)");
ylabel("m(t)");
axis([-4000,4000,-0.1,0.6]);

subplot(5,4,7);
plot(freq,abs(ct_final/length(freq)));
grid on;
title("Q2(d) : Freq Spectrum of c(t)");
xlabel("Frequency(Hz)");
ylabel("c(t)");
axis([-4000,4000,-0.1,0.5]);

subplot(5,4,8);
plot(freq,abs(SSBSC_final_USB/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of SSBSC-signal(t)-USB");
xlabel("Frequency(Hz)");
ylabel("phi(t)");
axis([-5000,5000,-0.1,0.6]);

subplot(5,4,9);
plot(freq,abs(SSBSC_final_LSB/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of SSBSC-signal(t)-LSB");
xlabel("Frequency(Hz)");
ylabel("phi(t)");
axis([-5000,5000,-0.1,0.6]);

% question 2 part (e)

sync_demod_output = lowpass(SSBSC_signal_USB .* carrier_signal,250,Sampling_rate);
sync_demod_output = 2*(sync_demod_output);

sync_demod_output_2 = lowpass(SSBSC_signal_LSB .* carrier_signal,250,Sampling_rate);
sync_demod_output_2 = 2*(sync_demod_output_2);

subplot(5,4,10);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output of USB");
xlabel("time(s)");
ylabel("sync-demod-output");

subplot(5,4,11);
plot(t,sync_demod_output_2);
grid on;
title("Q1(e) : Sync. demod output of LSB");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(5,4,12);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q2(e) : Freq Spectrum of sync. output USB");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,0.6]);

sync_demod_final = fftshift(fft(sync_demod_output_2));
subplot(5,4,13);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q2(e) : Freq Spectrum of sync. output LSB");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,0.6]);

sync_demod_output = lowpass(SSBSC_signal_USB .*cos(2*pi*fc*t + 90*pi/180)*A_c,200,Sampling_rate);
sync_demod_output = 2*(sync_demod_output);

sync_demod_output_2 = lowpass(SSBSC_signal_LSB .*cos(2*pi*fc*t + 90*pi/180)*A_c,200,Sampling_rate);
sync_demod_output_2 = 2*(sync_demod_output_2);

subplot(5,4,14);
plot(t,sync_demod_output);
grid on;
title("Q2(e) : Sync.demod output of USB, phase=90");
xlabel("time(s)");
ylabel("sync-demod-output");

subplot(5,4,15);
plot(t,sync_demod_output_2);
grid on;
title("Q2(e) : Sync.demod output of LSB, phase=90");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(5,4,16);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q2(e) : Freq Spectrum of demod USB, phase=90");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,0.6]);

sync_demod_final = fftshift(fft(sync_demod_output_2));
subplot(5,4,17);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q2(e) : Freq Spectrum of demod LSB, phase=90");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,0.6]);