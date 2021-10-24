clc;clear;close all;

fm = 50;
fc = 250;
A_c = 2;
A_m = 1;
Sampling_rate = 5000;


% question 2 part (a) - message and carrier signal

t = 0:1/Sampling_rate:5/fm;
message_signal = A_m*cos(2*pi*fm*t);
subplot(3,3,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(a) : Message signal m(t)");

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(3,3,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q2(a) : Carrier signal c(t)");


% question 2 part (b) - kp = 0.25 rad/Volt

k_p = 0.25;
phase_modulated = pmmod(message_signal,fc,Sampling_rate,k_p);
subplot(3,3,3);
plot(t,phase_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q2(b) : phi(t) with k_p = 0.25 rad/Volt");


freq = (-Sampling_rate/2:10:Sampling_rate/2);
fft_phase_modulated = fftshift(fft(phase_modulated));

subplot(3,3,4);
plot(freq,(fft_phase_modulated/length(freq)));
grid on;
title("Q2(b) : Freq Spectrum of phi(t) with k_p = 0.25 rad/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");


% question 2 part (c) - kp = 2 rad/Volt

k_p = 2;
phase_modulated_1 = pmmod(message_signal,fc,Sampling_rate,k_p);
subplot(3,3,5);
plot(t,phase_modulated_1);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q2(c) : phi(t) with k_p = 2 rad/Volt");


freq = (-Sampling_rate/2:10:Sampling_rate/2);
fft_phase_modulated_1 = fftshift(fft(phase_modulated_1));

subplot(3,3,6);
plot(freq,(fft_phase_modulated_1/length(freq)));
grid on;
title("Q2(c) : Freq Spectrum of phi(t) with k_p = 2 rad/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");

% question 1 part (e) - demodulated signal of kp = 2 rad/Volt

k_p = 2;
demodulated_signal = pmdemod(phase_modulated_1,fc,Sampling_rate,k_p);
subplot(3,3,7);
plot(t,demodulated_signal);
grid on;
xlabel("Time(sec)");
ylabel("demodulated signal");
title("Q2(e) : demodulated signal with k_p = 100 rad/Volt");

