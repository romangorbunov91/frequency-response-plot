function output = LPF(f, R1, R2, R3, R4, C1, C2)
s = 1i * 2*pi * f;

K = 1 + R4/R3;
w0 = 1/sqrt(R1*R2*C1*C2);
Q = sqrt(R1*R2*C1*C2) / ((R1+R2)*C1 + R1*C2*(1-K));

output = K ./ (1 + s/(Q*w0) + s.^2/w0^2);
end