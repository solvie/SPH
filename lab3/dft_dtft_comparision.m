dft_signal= [1,-1,0,2];
X = DFTcoefficients(dft_signal);

omega = -2*pi:0.1:2*pi;
n = 0:1:100;
w0 = 2;
%x = exp(n .* (1i*w0)); % x = exp(jw0n)

syms y(a)
y(a) = piecewise(0<a<3, 1, 0);


for b= 1: length(omega)
    X_1 = DTFTcomputatation(y,exp(-omega(b)*j));
end

disp(X');
disp(X_1);
