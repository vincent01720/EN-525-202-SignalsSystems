function output = dtfs(input,flag)
% output = dtfs(input,flag)
% If flag = 1, then output is periodic signal x[n] with input DTFS coefficients
% If flag = -1, then output is DTFS coefficients c_k of input x[n]
%
N = length(input);
output = zeros(size(input));
if flag == 1
for n=0:(N-1)
output(n+1) = sum(input.*exp(1i*2*pi*(0:N-1)*n/N));
end
% figure
% subplot(211), stem(0:N-1,abs(input),'linewidth',2), ylabel('|c_k|'); xlabel('k'); grid on
% subplot(212), stem(0:N-1,real(output),'linewidth',2), ylabel('x[n]'); xlabel('n'); grid on
elseif flag == -1
for k=0:(N-1)
output(k+1) = sum(input.*exp(-1i*2*pi*(0:N-1)*k/N));
end
output = output/N;
figure
subplot(211), stem(0:N-1,input,'linewidth',2), ylabel('x[n]'); xlabel('n') ; grid on
subplot(212), stem(0:N-1,abs(output),'linewidth',2), ylabel('|c_k|'); xlabel('k'); grid on
else
disp('flag must be either 1 or -1')
return
end
