function sq_wave(N)
figure(101)
t = -2:1e-4:2;
x = zeros(size(t));

subplot(211), plot(t,x,'linewidth',2); grid on; title('k = 0 term'); ylabel('Amplitude');
subplot(212), plot(t,x,'linewidth',2); grid on; title('k = 0 term'); ylabel('Amplitude'); 
xlabel('t');
pause
for k = 1:2:N
term = 4*sin(2*pi*k*t)/(k*pi);
x = x + term;
subplot(211), plot(t,term,'linewidth',2); grid on; ylabel('Amplitude')
title(['k = ',int2str(k),' term'])
subplot(212), plot(t,x,'linewidth',2); grid on; ylabel('Amplitude'); xlabel('t')
title(['Total number of terms = ',int2str(k)]);
pause
end