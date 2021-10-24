clc;clear;close all;

fm = 100;
fc = 2000;
A_c = 2;
Am = 2;
Sampling_rate = 30000;

% question 1 part (a)

t = 0:1/Sampling_rate:4/fm;
message_signal = Am*cos(2*pi*fm*t);
subplot(4,4,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Message signal m(t)");
%axis([0,5/200,-2,2]);

% question 1 part (b)

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(4,4,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q1(b) : Carrier signal c(t)");
%axis([0,5/200,-2,2]);


% question 1 part (c)

message_h = Am*cos(2*pi*fm*t - pi/2);
SSBSC_signal_USB = A_c*message_signal.*cos(2*pi*fc*t) - A_c*message_h.*sin(2*pi*fc*t);
subplot(4,4,3);
plot(t,SSBSC_signal_USB);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : SSB-SC signal phi(t) USB trasmission");

SSBSC_signal_LSB = A_c*message_signal.*cos(2*pi*fc*t) + A_c*message_h.*sin(2*pi*fc*t);
subplot(4,4,4);
plot(t,SSBSC_signal_LSB);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : SSB-SC signal phi(t) LSB trasmission");

% question 1 part (d)

freq = (-Sampling_rate/2:25:Sampling_rate/2);
mt_final = fftshift(fft(message_signal));
ct_final = fftshift(fft(carrier_signal));
SSBSC_final_USB = fftshift(fft(SSBSC_signal_USB));
SSBSC_final_LSB = fftshift(fft(SSBSC_signal_LSB));

subplot(4,4,5);
plot(freq,abs(mt_final/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of m(t)");
xlabel("Frequency(Hz)");
ylabel("m(t)");
axis([-2000,2000,-0.1,1.1]);

subplot(4,4,6);
plot(freq,abs(ct_final/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of c(t)");
xlabel("Frequency(Hz)");
ylabel("c(t)");
axis([-10000,10000,-0.1,1.1]);

subplot(4,4,7);
plot(freq,abs(SSBSC_final_USB/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of SSBSC-signal(t)-USB");
xlabel("Frequency(Hz)");
ylabel("phi(t)");
axis([-5000,5000,-0.1,2.1]);

subplot(4,4,8);
plot(freq,abs(SSBSC_final_LSB/length(freq)));
grid on;
title("Q1(d) : Freq Spectrum of SSBSC-signal(t)-LSB");
xlabel("Frequency(Hz)");
ylabel("phi(t)");
axis([-5000,5000,-0.1,2.1]);

% question 1 part (e)

sync_demod_output = lowpass(SSBSC_signal_USB .* carrier_signal,220,Sampling_rate);
sync_demod_output = (sync_demod_output/2);

sync_demod_output_2 = lowpass(SSBSC_signal_LSB .* carrier_signal,220,Sampling_rate);
sync_demod_output_2 = (sync_demod_output_2/2);

subplot(4,4,9);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output of USB");
xlabel("time(s)");
ylabel("sync-demod-output");

subplot(4,4,10);
plot(t,sync_demod_output_2);
grid on;
title("Q1(e) : Sync. demod output of LSB");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(4,4,11);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q1(e) : Freq Spectrum of sync. output USB");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,1.1]);

sync_demod_final = fftshift(fft(sync_demod_output_2));
subplot(4,4,12);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q1(e) : Freq Spectrum of sync. output LSB");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-2000,2000,-0.1,1.1]);

sync_demod_output = lowpass(SSBSC_signal_USB .*cos(2*pi*fc*t + 90*pi/180)*A_c,200,Sampling_rate);
sync_demod_output = (sync_demod_output/2);

sync_demod_output_2 = lowpass(SSBSC_signal_LSB .*cos(2*pi*fc*t + 90*pi/180)*A_c,200,Sampling_rate);
sync_demod_output_2 = (sync_demod_output_2/2);

subplot(4,4,13);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync.demod output of USB, phase=90");
xlabel("time(s)");
ylabel("sync-demod-output");

subplot(4,4,14);
plot(t,sync_demod_output_2);
grid on;
title("Q1(e) : Sync.demod output of LSB, phase=90");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(4,4,15);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q1(e) : Freq Spectrum of demod USB, phase=90");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-500,500,-0.1,1.1]);

sync_demod_final = fftshift(fft(sync_demod_output_2));
subplot(4,4,16);
plot(freq,abs(sync_demod_final/length(freq)));
grid on;
title("Q1(e) : Freq Spectrum of demod LSB, phase=90");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-500,500,-0.1,1.1]);
