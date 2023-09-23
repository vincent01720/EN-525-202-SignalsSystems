%lti_periodic
%generates a periodic signal, computes its DTFS, and applies LPF
clf;
Fs=8000; T=1; freq=500; M = 21; K=8192;
tt = 0:1/Fs:T-(1/Fs); x=zeros(size(tt));
for n=1:7
amp = rand(1,1);
theta = 2*pi*rand(1,1);
x = x + amp*cos(2*pi*tt*n*freq + theta);
end
soundsc(x,Fs);
a = fft(x)/(Fs*T);
subplot(2,1,1),stem(0:7999,abs(a),'b');grid on
xlabel('k'); ylabel('|DTFS|'); hold on; title('LTI Systems with Periodic Inputs')
h = firpm(M-1,[0 1500/4000 1950/4000 1],[1 1 0 0],[1 10]); pause
subplot(2,1,2), plot(0:2/K:2*(K-1)/K, abs(fft(h,K))); grid on
xlabel('\omega (\times\pi rad/sample)'); ylabel('|H(\omega)|');
y = conv(x,h); pause
c = fft( y( ((M-1)/2)+1:8000 + (M-1)/2 ) )/(Fs*T);
subplot(2,1,1),stem(0:7999,abs(c),'rx');grid on
xlabel('k'); ylabel('|DTFS|');hold off; legend('input','output')
soundsc(y,Fs);
