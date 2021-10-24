clc;clear;close all;

% Question 2(a) 

n11 = -2; 
n21 = -2;
n12 = 2; 
n22 = 2;

signal_1_unshifted = ones(1,n12-n11+1);
signal_2_unshifted = ones(1,n22-n21+1);
result = conv_result(signal_1_unshifted,signal_2_unshifted);
t = -4:4;

subplot(3,4,1);
plot(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(a): using conv-result() continuous");

subplot(3,4,2);
plot(t, conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(a): using conv() continuous");

subplot(3,4,3);
stem(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(a): using conv-result() discrete");

subplot(3,4,4);
stem(t, conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(a): using conv() discrete");

% Question 2(b)

n11 = -2; 
n21 = 0;
n12 = 2; 
n22 = 4;

signal_1_unshifted = ones(1,n12-n11+1);
signal_2_unshifted = ones(1,n22-n21+1);
result = conv_result(signal_1_unshifted,signal_2_unshifted);
t = -2:6;

subplot(3,4,5);
plot(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(b): using conv-result() continuous");

subplot(3,4,6);
plot(t, conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(b) : using conv() continuous");

subplot(3,4,7);
stem(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(b) :using conv-result() discrete");

subplot(3,4,8);
stem(t, conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(b) : using conv() discrete");

% Question 2(c)

n11 = -5; 
n12 = 5; 
n21 = -1; 
n22 = 6;

signal_1_unshifted = ones(1,n12-n11+1);
signal_2_unshifted = ones(1,n22-n21+1);
result = conv_result(signal_1_unshifted,signal_2_unshifted);
t = -6:11;

subplot(3,4,9);
plot(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(c) :using conv-result() continuous");
axis([-6,12,0,8]);
xticks(-6:2:12);

subplot(3,4,10);
plot(t,conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(c) : using conv() continuous");
axis([-6,12,0,8]);
xticks(-6:2:12);

subplot(3,4,11);
stem(t, result);
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(c) :using conv-result() discrete");
axis([-6,12,0,8]);
xticks(-6:2:12);

subplot(3,4,12);
stem(t,conv(signal_1_unshifted,signal_2_unshifted));
grid on;
xlabel("Time(sec)");
ylabel("Convolution");
title("Q2(d)-(c) : using conv() discrete");
axis([-6,12,0,8]);
xticks(-6:2:12);
% The conv_result function that generates the convoluton result between two
% discretized signals

function f = conv_result(x1n,x2n)
    
    conv_len = size(x1n) + size(x2n) - 1;
    conv_arr = zeros(conv_len);
    
    for i = 1:size(x1n,2)
        for j = 1:size(x2n,2)
            conv_arr(i+j-1) = x1n(i)*x2n(j) + conv_arr(i+j-1);
        end
    end
    
    f = conv_arr;
    
end

