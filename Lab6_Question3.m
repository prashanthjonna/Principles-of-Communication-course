clc;clear;close all;

fm = 50;
fc = 250;
A_c = 2;
A_m = 1;
Sampling_rate = 5000;

t = 0:1/Sampling_rate:5/fm;
message_signal = A_m*cos(2*pi*fm*t);
carrier_signal = A_c*cos(2*pi*fc*t);

% question 1 part (b) - kf = 12.5 Hz/Volt

k_f = 12.5;
freq_modulated = fmmod(message_signal,fc,Sampling_rate,k_f);
subplot(2,2,1);
plot(t,freq_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(b) : phi(t) with k_f = 12.5 Hz/Volt");

% question 1 part (c) - kf = 100 Hz/Volt

k_f = 100;
freq_modulated_1 = fmmod(message_signal,fc,Sampling_rate,k_f);
subplot(2,2,3);
plot(t,freq_modulated_1);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : phi(t) with k_f = 100 Hz/Volt");

% question 2 part (b) - kp = 0.25 rad/Volt

k_p = 0.25;
phase_modulated = pmmod(message_signal,fc,Sampling_rate,k_p);
subplot(2,2,2);
plot(t,phase_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q2(b) : phi(t) with k_p = 0.25 rad/Volt");

% question 2 part (c) - kp = 2 rad/Volt

k_p = 2;
phase_modulated_1 = pmmod(message_signal,fc,Sampling_rate,k_p);
subplot(2,2,4);
plot(t,phase_modulated_1);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q2(c) : phi(t) with k_p = 2 rad/Volt");
