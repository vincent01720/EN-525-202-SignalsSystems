function x = dtsq_wave(N,N1)
% x = dtsq_wave(N,N1)
% Generates a discrete-time periodic square wave using the DTFS.
% The square wave has value 1 from -N1 to N1.
% N is the period. IT MUST BE ODD.
if 2*round(N/2) == N
error('N must be odd')
end
figure
n = (-3*N)-N1-1:3*N+N1+1;
term = ((2*N1)+1)*ones(size(n))/N;
x = term;
for k = 1:(N-1)/2
subplot(2,1,1), stem(n,term); grid on; ylabel('Amplitude'); xlim([n(1) n(end)])
title('New term')
subplot(2,1,2), stem(n,x); grid on; xlabel('n'); ylabel('x[n]')
title(['Number of terms = ',int2str(k)]); xlim([n(1) n(end)])
pause
term = 2*sin(2*pi*(N1+.5)*k/N)*cos(2*pi*n*k/N)/(N*sin(pi*k/N));
x = x + term;
end
stem(n,x); grid on; xlabel('n'); ylabel('x[n]'); xlim([n(1) n(end)])
title(['Discrete-time Square Wave with N = ',int2str(N),', N_1 = ',int2str(N1)])
