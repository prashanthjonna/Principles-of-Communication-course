clc;clear;close all;

ka = 1;
fm = 100;
fc = 2000;
Sampling_rate = 50000;

% question 1 part (a)

Am = 1;
t = 0:1/Sampling_rate:2/100;
message_signal = Am*cos(2*pi*fm*t);
subplot(4,2,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Message signal m(t)");
axis([0,0.02,-1,1]);

% question 1 part (b)

A_c = 1;
carrier_signal = A_c*cos(2*pi*fc*t);
subplot(4,2,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q1(b) : carrier signal c(t)");
axis([0,0.02,-1,1]);


% question 1 part (c)

mu = 0.5;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
subplot(4,2,3);
plot(t,AM_signal);
grid on;
xlabel("Time(sec)");
ylabel("s(t)");
title("Q1(c) : AM signal s(t), Ac = 0.5");
    
mu = 1;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
subplot(4,2,4);
plot(t,AM_signal);
grid on;
xlabel("Time(sec)");
ylabel("s(t)");
title("Q1(c) : AM signal s(t), Ac = 1");

mu = 2;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
subplot(4,2,5);
plot(t,AM_signal);
grid on;
xlabel("Time(sec)");
ylabel("s(t)");
title("Q1(c) : AM signal s(t), Ac = 2");

% question 1 part (d)

freq = (-Sampling_rate/2:1/0.02:Sampling_rate/2);
mt_final = fftshift(fft(message_signal));
ct_final = fftshift(fft(carrier_signal));

subplot(4,2,6);
plot(freq,mt_final/length(freq));
grid on;
title("Q1(d) : Freq Spectrum of m(t)");
xlabel("Frequency(Hz)");
ylabel("m(t)");
axis([-4000,4000,0,0.6]);

subplot(4,2,7);
plot(freq,ct_final/length(freq));
grid on;
title("Q1(d) : Freq Spectrum of c(t)");
xlabel("Frequency(Hz)");
ylabel("c(t)");
axis([-10000,10000,-0.2,0.6]);

% question 1 part (e)
figure;

mu = 0.5;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
carrier_signal = A_c*cos(2*pi*fc*t);
sync_demod_output = lowpass(AM_signal .* carrier_signal,120,Sampling_rate);
sync_demod_output = (sync_demod_output - ((A_c^2)/2))/(((A_c^2)/2)*ka*mu);

subplot(2,3,1);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output for mu = 0.5 ");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(2,3,4);
plot(freq,sync_demod_final/length(freq));
grid on;
title("Q1(e) : Freq Spectrum of sync. output for mu = 0.5 ");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-4000,4000,0,0.6]);

mu = 1;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
carrier_signal = A_c*cos(2*pi*fc*t);
sync_demod_output = lowpass(AM_signal .* carrier_signal,120,Sampling_rate);
sync_demod_output = (sync_demod_output - ((A_c^2)/2))/(((A_c^2)/2)*ka*mu);

subplot(2,3,2);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output for mu = 1 ");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(2,3,5);
plot(freq,sync_demod_final/length(freq));
grid on;
title("Q1(e) : Freq Spectrum of sync. output for mu = 1");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-4000,4000,0,0.6]);

mu = 2;
A_c = 1/mu;
AM_signal = A_c*(1+mu*ka*message_signal).*cos(2*pi*fc*t);
carrier_signal = A_c*cos(2*pi*fc*t);
sync_demod_output = lowpass(AM_signal .* carrier_signal,120,Sampling_rate);
sync_demod_output = (sync_demod_output - ((A_c^2)/2))/(((A_c^2)/2)*ka*mu);

subplot(2,3,3);
plot(t,sync_demod_output);
grid on;
title("Q1(e) : Sync. demod output for mu = 2 ");
xlabel("time(s)");
ylabel("sync-demod-output");

sync_demod_final = fftshift(fft(sync_demod_output));
subplot(2,3,6);
plot(freq,sync_demod_final/length(freq));
grid on;
title("Q1(e) : Freq Spectrum of sync. output for mu = 2");
xlabel("Frequency(Hz)");
ylabel("sync-demod-output");
axis([-4000,4000,0,0.6]);
