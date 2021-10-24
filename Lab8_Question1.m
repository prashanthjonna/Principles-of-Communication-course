Am = 1;
fm = 10;

% Part (a)

tc = linspace(0,2/fm,100);
message_signal = Am*sin(2*pi*fm*tc);

subplot(2,3,1);
plot(tc,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Continuous Message signal m(t)");

sampling_rate = 10*fm;
td = (0:1/sampling_rate:2/fm);
message_signal_discrete = Am*sin(2*pi*fm*td);

subplot(2,3,2);
stem(td,message_signal_discrete);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(a) : Sampled Message signal m(t)");


% Part (b)

subplot(2,3,3);
plot(tc,reconstruct(10*fm));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(b) : Reconstructed Message signal m(t) with fs = 10fm");


% Part (c)

subplot(2,3,4);
plot(tc,reconstruct(2*fm));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(c) : Reconstructed Message signal m(t) with fs = 2fm");
axis([0,0.2,-1,1])

subplot(2,3,5);
plot(tc,reconstruct(fm));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q1(c) : Reconstructed Message signal m(t) with fs = fm");
axis([0,0.2,-1,1])


function xr = reconstruct(fs)

  Am = 1;
  fm = 10;
  Fs = fs;    
  Ts = 1/Fs;
  tc = linspace(0,2/fm,100);
  td = (0:1/Fs:2/fm);
  N = length(td);
  message_signal_discrete = Am*sin(2*pi*fm*td);
  
  xr = zeros(size(tc));
  sinc_train = zeros(N,length(tc));
  for t = 1:length(tc)
      for n = 0:N-1
          sinc_train(n+1,:) = sin(pi*(tc-n*Ts)/Ts)./(pi*(tc-n*Ts)/Ts);
          xr(t) = xr(t) + message_signal_discrete(n+1)*sin(pi*(tc(t)-n*Ts)/Ts)/(pi*(tc(t)-n*Ts)/Ts);
      end
  end
    
end
