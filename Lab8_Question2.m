Am = 2;
fm = 10;

% Part (a)

tc = linspace(0,1/fm,100);
message_signal = Am*sin(2*pi*fm*tc);

subplot(2,4,1);
plot(tc,message_signal);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(a) : Continuous Message signal m(t)");

sampling_rate = 50*fm;
td = (0:1/sampling_rate:1/fm);
message_signal_discrete = Am*sin(2*pi*fm*td);

subplot(2,4,2);
stem(td,message_signal_discrete);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(a) : Sampled Message signal m(t)");


% Part (b)

subplot(2,4,3);
stem(td,quantize_msg(16));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Quantized Message signal m(t)with L = 16");

subplot(2,4,4);
stem(td,quantize_msg(64));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Quantized Message signal m(t)with L = 64");

subplot(2,4,5);
stem(td,quantize_msg(256));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Quantized Message signal m(t)with L = 256");

disp("The bitcode sequence for L = 16");
disp(generate_bitcode(quantize_msg(16),16));

disp("The bitcode sequence for L = 64");
disp(generate_bitcode(quantize_msg(64),64));

disp("The bitcode sequence for L = 256");
disp(generate_bitcode(quantize_msg(256),256));


subplot(2,4,6);
disp(decode_bit_sequence(generate_bitcode(quantize_msg(16),16),16));
stem(td,decode_bit_sequence(generate_bitcode(quantize_msg(16),16),16)-180);
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Decoded Message signal m(t)with L = 16");

subplot(2,4,7);
stem(td,decode_bit_sequence(generate_bitcode(quantize_msg(64),64),64));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Decoded Message signal m(t)with L = 64");

subplot(2,4,8);
stem(td,decode_bit_sequence(generate_bitcode(quantize_msg(256),256),256));
grid on;
xlabel("Time(sec)");
ylabel("m(t)");
title("Q2(b) : Decoded Message signal m(t)with L = 256");


function bitcode = generate_bitcode(xr,L)

  range = linspace(-2,2,L);
  ratio_1 = 4/L;
  bitcode = [];
  
  for i=1:length(xr)
     
      for j=1:length(range)
          
          if xr(i) == range(j)
              newval = dec2bin(((range(j)+2)/ratio_1),log2(L));
              bitcode = [bitcode newval];
          end
          
      end
      
  end

end



function decoded_signal = decode_bit_sequence(bitcode,L)

  ratio_1 = 4/L;
  decoded_signal = [];
  
  for i=1:log2(L):length(bitcode)-log2(L)
    value = 0;
    for j=i:i+log2(L)-1
       value = value + bitcode(j)*(2^(i+log2(L)-1-j));
    end
      
    newval = (ratio_1*value)-2;
    decoded_signal = [decoded_signal newval];
      
  end
  
  decoded_signal(end)=[];

end



function xr = reconstruct(fs)

  Am = 1; fm = 10;
  Fs = fs; Ts = 1/Fs;
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



function message_signal_discrete = quantize_msg(L)
 
  Am = 2; fm = 10;
  sampling_rate = 50*fm;
  td = (0:1/sampling_rate:1/fm);
  message_signal_discrete = Am*sin(2*pi*fm*td);
  range = linspace(-2,2,L);
  
  for i = 1:length(message_signal_discrete)
   
    [c, index] = min(abs(range - message_signal_discrete(i)));
    message_signal_discrete(i) = range(index);
    
  end

end