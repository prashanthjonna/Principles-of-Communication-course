clc;clear;close all;

fm = 50;
fc = 250;
A_c = 2;
A_m = 1;
Sampling_rate = 5000;


% question 1 part (a) - message and carrier signal

t = 0:1/Sampling_rate:5/fm;
message_signal = A_m*cos(2*pi*fm*t);
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
freq_modulated = fmmod(message_signal,fc,Sampling_rate,k_f);
subplot(3,3,3);
plot(t,freq_modulated);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(b) : phi(t) with k_f = 12.5 Hz/Volt");


freq = (-Sampling_rate/2:10:Sampling_rate/2);
fft_freq_modulated = fftshift(fft(freq_modulated));

subplot(3,3,4);
plot(freq,(fft_freq_modulated/length(freq)));
grid on;
title("Q1(b) : Freq Spectrum of phi(t) with k_f = 12.5 Hz/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");


% question 1 part (c) - kf = 100 Hz/Volt

k_f = 100;
freq_modulated_1 = fmmod(message_signal,fc,Sampling_rate,k_f);
subplot(3,3,5);
plot(t,freq_modulated_1);
grid on;
xlabel("Time(sec)");
ylabel("phi(t)");
title("Q1(c) : phi(t) with k_f = 100 Hz/Volt");


freq = (-Sampling_rate/2:10:Sampling_rate/2);
fft_freq_modulated_1 = fftshift(fft(freq_modulated_1));

subplot(3,3,6);
plot(freq,(fft_freq_modulated_1/length(freq)));
grid on;
title("Q1(c) : Freq Spectrum of phi(t) with k_f = 100 Hz/Volt");
xlabel("Frequency(Hz)");
ylabel("phi(f)");

% question 1 part (e) - demodulated signal of kf = 100 Hz/Volt

k_f = 100;
demodulated_signal = fmdemod(freq_modulated_1,fc,Sampling_rate,k_f);
subplot(3,3,7);
plot(t,demodulated_signal);
grid on;
xlabel("Time(sec)");
ylabel("demodulated signal");
title("Q1(e) : demodulated signal with k_f = 100 Hz/Volt");

% question 1 part (d) - calculating power and bandwidth

disp("The power values ranging from 12.5 to 100 Hz/Volt :");

R = 1;

for i = 13:100
    
    k_f = i;
    beta = A_m*k_f/fm;
    
    if beta > 1                   % for wideband
        power = A_c*A_c/2*R;
        disp(power);
    end
    
    if beta <= 1                  % for narrowband
        power = A_c*A_c/2*R*(1+beta*beta/2);
        disp(power);
    end
           
end

disp("The bandwidth values ranging from 12.5 to 100 Hz/Volt :");

for i = 13:100
    
    k_f = i;
    beta = A_m*k_f/fm;
    
    if beta > 1                   % for wideband
        bw = 2*(beta + 1)*fm;
        disp(bw);
    end
    
    if beta <= 1                  % for narrowband
        bw = 2*fm;
        disp(bw);
    end
           
end