function ctft_exp(a)
% Plot the CTFT of a 1-sided exponential

figure

tt = -2:0.001:10;
x_tt = zeros(size(tt));
ind = find(tt >= 0);
x_tt(ind) = exp(-a*tt(ind));

omega = -20:0.001:20;

X_omega = 1./(a + 1i*omega);

subplot(311), plot(tt,x_tt,'linewidth',2); grid on; xlabel('t (sec)'); ylabel('x(t)'); title(['a = ',num2str(a)])
subplot(312), plot(omega,abs(X_omega),'linewidth',2); grid on; xlabel('\Omega (rad/sec)'); ylabel('|X(\Omega)|')
ylim([0 1/a])
subplot(313), plot(omega,angle(X_omega),'linewidth',2); grid on; xlabel('\Omega (rad/sec)'); ylabel('Ang X(\Omega)')



