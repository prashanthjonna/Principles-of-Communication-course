clc;clear;close all;

fm1 = 25;
fm2 = 50;
fc = 250;
A_c = 2;
A_m1 = 1;
A_m2 = 2;
Sampling_rate = 5000;


% question 2 part (a) - message and carrier signal

t = 0:1/Sampling_rate:3/fm1;
message_signal = A_m1*cos(2*pi*fm1*t) + A_m2*cos(2*pi*fm2*t);
subplot(2,3,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(a) : Message signal m(t)");

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(2,3,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q2(a) : Carrier signal c(t)");


% question 2 part (b) - kp = 0.25 rad/Volt

k_p = 0.25;
phase_modulated = A_c*pmmod(message_signal,fc,Sampling_rate,k_p*(A_m1 +A_m2));
subplot(2,3,3);
plot(t,phase_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q2(b) : phi(t) with k_p = 0.25 rad/Volt");


freq = (-Sampling_rate/2:Sampling_rate/length(t):Sampling_rate/2-1);
fft_phase_modulated = fftshift(fft(phase_modulated));

subplot(2,3,4);
plot(freq,(fft_phase_modulated/length(freq)));
grid on;
title("Q2(b) : Freq Spectrum of phi(t) with k_p = 0.25 rad/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");

% question 2 part (c) - kp = 0.25 rad/Volt

k_p = 0.25;
phase_modulated_1 = A_c*pmmod(message_signal,fc,Sampling_rate,k_p*(A_m1 +A_m2));

freq = (-Sampling_rate/2:Sampling_rate/length(t):Sampling_rate/2-1);
fft_phase_modulated_1 = fftshift(fft(phase_modulated_1));

% question 2 part (d) - demodulated signal of kp = 0.25 rad/Volt

k_p = 0.25;
demodulated_signal = pmdemod(phase_modulated_1,fc,Sampling_rate,k_p*(A_m1 +A_m2));
subplot(2,3,5);
plot(t,demodulated_signal);
grid on;
xlabel("Time(sec)");
ylabel("demodulated signal");
title("Q2(d) : demodulated signal with k_p = 0.25 rad/Volt");

