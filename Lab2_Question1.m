clc;clear;close all;

Sampling_rate = 10000;
t = 0:1/Sampling_rate:0.1;
    
% question 1(a) - duty cycle 50 percent

subplot(2,3,1);
plot(t,generatesqwave(0.5));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(a) : duty cycle = 50% (continuous time)");
axis([0,0.1,-1.1,1.1]);

subplot(2,3,4);
stem(t,generatesqwave(0.5));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(a) : duty cycle = 50% (discrete time)");
axis([0,0.1,-1.1,1.1]);

% question 1(b) - duty cycle 25 percent

subplot(2,3,2);
plot(t,generatesqwave(0.25));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(b) : duty cycle = 25% (continuous time)");
axis([0,0.1,-1.1,1.1]);

subplot(2,3,5);
stem(t,generatesqwave(0.25));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(b) :  duty cycle = 25% (discrete time)");
axis([0,0.1,-1.1,1.1]);

% question 1(c) - duty cycle 75 percent

subplot(2,3,3);
plot(t,generatesqwave(0.75));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(c) : duty cycle = 75% (continuous time)");
axis([0,0.1,-1.1,1.1]);

subplot(2,3,6);
stem(t,generatesqwave(0.75));
grid on;
xlabel("Time(sec)");
ylabel("x(t)");
title("Q1(c) : duty cycle = 75% (discrete time)");
axis([0,0.1,-1.1,1.1]);

function f = generatesqwave(duty_cycle)
    
    wave_freq = 50;
    time_period = 1/wave_freq; 
    max_amp = 1;
    min_amp = -1;
    Sampling_rate = 10000;
    x = zeros(1,(Sampling_rate)*0.1+1);
    
    for i = 1:size(x,2)

        remainder = rem(i/Sampling_rate,time_period);

        if remainder < time_period*duty_cycle
            x(i) = max_amp; 
        elseif remainder > time_period*duty_cycle 
            x(i) = min_amp;
        else 
            x(i) = 0;
        end
    end

    f = x;
    
end