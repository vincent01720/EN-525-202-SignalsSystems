% Vincent Yim
% Source: sq_wave.m, JHU
% Module 3, Problem 1C (extra credit)
% This function use DTFS to estimate and plot x(t)
% x(t) = sum(x_k*exp(i*2*pi*k*t/T))
% x_0 = 1/2
% x_k = 0, if k is even
% x_k = (6/(pi*pi*k*k))*sin(pi*k/2)*sin(pi*k/6), if k is odd

function sq_wave_extra(N)
figure(101)
t = -10:1e-4:10;
x = 0.5 + zeros(size(t));

subplot(211), plot(t,x,'linewidth',2); grid on; title('k = 0 term'); ylabel('Amplitude');
subplot(212), plot(t,x,'linewidth',2); grid on; title('k = 0 term'); ylabel('Amplitude'); ylim([-0.5,1.5]);
xlabel('t');
pause
for k = 1:2:N
% -/+ k, 2 terms    
term = 2*(6/(pi*pi*k*k))*sin(pi*k/2)*sin(pi*k/6)*exp(1i*pi*k*t/2);
x = x + term;
subplot(211), plot(t,term,'linewidth',2); grid on; ylabel('Amplitude');
title(['k = ',int2str(k),' term'])
subplot(212), plot(t,x,'linewidth',2); grid on; ylabel('Amplitude'); xlabel('t');ylim([-0.5,1.5]);
title(['Total number of terms = ',int2str(k)]);
pause
end  