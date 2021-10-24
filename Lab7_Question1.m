clc;clear;close all;

fm1 = 25;
fm2 = 50;
fc = 250;
A_c = 2;
A_m1 = 1;
A_m2 = 2;
Sampling_rate = 5000;


% question 1 part (a) - message and carrier signal

t = 0:1/Sampling_rate:3/fm1;
message_signal = A_m1*cos(2*pi*fm1*t) + A_m2*cos(2*pi*fm2*t);
subplot(3,3,1);
plot(t,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Message signal m(t)");

carrier_signal = A_c*cos(2*pi*fc*t);
subplot(3,3,2);
plot(t,carrier_signal);
grid on;
xlabel("Time(sec)");
ylabel("c(t)");
title("Q1(a) : Carrier signal c(t)");


% question 1 part (b) - kf = 12.5 Hz/Volt

k_f = 12.5;
freq_modulated = A_c*fmmod(message_signal,fc,Sampling_rate,k_f*(A_m1 + A_m2));
subplot(3,3,3);
plot(t,freq_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(b) : phi(t) with k_f = 12.5 Hz/Volt");


freq = (-Sampling_rate/2:Sampling_rate/length(t):Sampling_rate/2-1);
fft_freq_modulated = fftshift(fft(freq_modulated));
disp(size(freq));
disp(size(fft_freq_modulated));
subplot(3,3,4);
plot(freq,(fft_freq_modulated/length(freq)));
grid on;
title("Q1(b) : Freq Spectrum of phi(t) with k_f = 12.5 Hz/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");


% question 1 part (c) - kf = 100 Hz/Volt

k_f = 100;
freq_modulated_1 = A_c*fmmod(message_signal,fc,Sampling_rate,k_f*(A_m1 + A_m2));
subplot(3,3,5);
plot(t,freq_modulated_1);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : phi(t) with k_f = 100 Hz/Volt");


freq = (-Sampling_rate/2:Sampling_rate/length(t):Sampling_rate/2-1);
fft_freq_modulated_1 = fftshift(fft(freq_modulated_1));

subplot(3,3,6);
plot(freq,(fft_freq_modulated_1/length(freq)));
grid on;
title("Q1(c) : Freq Spectrum of phi(t) with k_f = 100 Hz/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");

% question 1 part (d) - demodulated signal of kf = 100 Hz/Volt

k_f = 125;
freq_modulated_2 = A_c*fmmod(message_signal,fc,Sampling_rate,k_f*(A_m1 + A_m2));
demodulated_signal = fmdemod(freq_modulated_2,fc,Sampling_rate,k_f*(A_m1 + A_m2));
subplot(3,3,7);
plot(t,demodulated_signal);
grid on;
xlabel("Time(sec)");
ylabel("demodulated signal");
title("Q1(d) : demodulated signal with k_f = 125 Hz/Volt");