clc;clear;close all;

Sampling_rate = 2000;
t = -1:1/Sampling_rate:1;
m1t = 2*cos(2*pi*50*t);
m2t = 2*cos(2*pi*50*t) + 6*cos(2*pi*100*t);


% Question 3(a) - plot m1[t] and m2[t]

subplot(2,3,1);
plot(t,m1t);
grid on;
title("3(a) - m1[t] Signal");
xlabel("Time(s)");
ylabel("m1(t)");
axis([0,0.1,-2,2]);

subplot(2,3,2);
plot(t,m2t);
grid on;
title("3(a) - m2[t] Signal");
xlabel("Time(s)");
ylabel("m2(t)");
axis([0,0.1,-6.2,8]);


% Question 3(b) - Frequency spectrum of m1[t] and m2[t]

freq = (-Sampling_rate/2:1/2:Sampling_rate/2);
m1t_final = fftshift(fft(m1t));
m2t_final = fftshift(fft(m2t));

subplot(2,3,3);
plot(freq,m1t_final/Sampling_rate);
grid on;
title("3(b) : Frequency Spectrum of m1(t)");
xlabel("Frequency(Hz)");
ylabel("m1 function");
axis([-100,100,-1,3]);

subplot(2,3,4);
plot(freq,m2t_final/Sampling_rate);
grid on;
title("3(b) : Frequency Spectrum of m2(t)");
xlabel("Frequency(Hz)");
ylabel("m2 function");
axis([-150,150,-4,7]);

% Question 3(c) - Phase spectrum of m1[t] and m2[t]

subplot(2,3,5);
plot(freq,angle(m1t_final)*180/pi);
grid on;
title("3(c) : Phase Spectrum of m1(t)");
xlabel("Frequency(Hz)");
ylabel("Phase(degrees)");
axis([-350,350,-200,200]);

subplot(2,3,6);
plot(freq,angle(m2t_final)*180/pi);
grid on;
title("3(c) : Phase Spectrum of m2(t)");
xlabel("Frequency(Hz)");
ylabel("Phase(degrees)");
axis([-350,350,-200,200]);