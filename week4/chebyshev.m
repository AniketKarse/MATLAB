
clc;
all clear;
N = 4;
f = @(x) exp(x);

k = 1:(N+1);
x_nodes = cos((2*k - 1) * pi / (2 * (N + 1)));
y_nodes = f(x_nodes);

c = zeros(1, N+1);
for j = 0:N
    T_j = cos(j * acos(x_nodes)); 
    
    c(j+1) = sum(y_nodes .* T_j) * (2 - (j == 0)) / (N + 1);
end

x_eval = linspace(-1, 1, 100);
P_eval = zeros(size(x_eval));
for j = 0:N
    P_eval = P_eval + c(j+1) * cos(j * acos(x_eval));
end

figure;
plot(x_eval, f(x_eval), 'b-', x_eval, P_eval, 'r--', x_nodes, y_nodes, 'ko');
grid on;
legend('Original f(x) = e^x', sprintf('Chebyshev P_{%d}(x)', N), 'Nodes');
title('Chebyshev Interpolation');
